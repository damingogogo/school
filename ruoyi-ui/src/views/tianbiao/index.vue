<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="表单ID" prop="fromid">
        <el-input
          v-model="queryParams.fromid"
          placeholder="请输入表单ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="家长ID" prop="homeid">
        <el-input
          v-model="queryParams.homeid"
          placeholder="请输入家长ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学生ID" prop="stuid">
        <el-input
          v-model="queryParams.stuid"
          placeholder="请输入学生ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="当前状态" prop="state">
        <el-select v-model="queryParams.state" placeholder="请选择当前状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_job_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="类型" prop="fromType">
        <el-select v-model="queryParams.fromType" placeholder="请选择类型" clearable>
          <el-option
            v-for="dict in dict.type.fromtype"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="创建时间" prop="createtime">
        <el-date-picker clearable
                        v-model="queryParams.createtime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['tianbiao:tianbiao:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['tianbiao:tianbiao:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['tianbiao:tianbiao:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['tianbiao:tianbiao:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="tianbiaoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="表单ID" align="center" prop="fromid" />
      <el-table-column label="内容" align="center" prop="title" />
      <el-table-column label="文件地址" align="center" prop="fileurl" />
      <el-table-column label="图片地址" align="center" prop="picurl" />
      <el-table-column label="家长ID" align="center" prop="homeid" />
      <el-table-column label="学生ID" align="center" prop="stuid" />
      <el-table-column label="家长姓名" align="center" prop="homename" />
      <el-table-column label="学生姓名" align="center" prop="stuname" />
      <el-table-column label="当前状态" align="center" prop="state">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_job_status" :value="scope.row.state"/>
        </template>
      </el-table-column>
      <el-table-column label="类型" align="center" prop="fromType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.fromtype" :value="scope.row.fromType"/>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createtime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createtime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['tianbiao:tianbiao:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['tianbiao:tianbiao:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改填表管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="表单ID" prop="fromid">
          <el-input v-model="form.fromid" placeholder="请输入表单ID" />
        </el-form-item>
        <el-form-item label="内容" prop="title">
          <el-input v-model="form.title" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="文件地址" prop="fileurl">
          <el-input v-model="form.fileurl" placeholder="请输入文件地址" />
        </el-form-item>
        <el-form-item label="图片地址" prop="picurl">
          <el-input v-model="form.picurl" placeholder="请输入图片地址" />
        </el-form-item>
        <el-form-item label="家长ID" prop="homeid">
          <el-input v-model="form.homeid" placeholder="请输入家长ID" />
        </el-form-item>
        <el-form-item label="学生ID" prop="stuid">
          <el-input v-model="form.stuid" placeholder="请输入学生ID" />
        </el-form-item>
        <el-form-item label="家长姓名" prop="homename">
          <el-input v-model="form.homename" placeholder="请输入家长姓名" />
        </el-form-item>
        <el-form-item label="学生姓名" prop="stuname">
          <el-input v-model="form.stuname" placeholder="请输入学生姓名" />
        </el-form-item>
        <el-form-item label="当前状态" prop="state">
          <el-select v-model="form.state" placeholder="请选择当前状态">
            <el-option
              v-for="dict in dict.type.sys_job_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="类型" prop="fromType">
          <el-select v-model="form.fromType" placeholder="请选择类型">
            <el-option
              v-for="dict in dict.type.fromtype"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listTianbiao, getTianbiao, delTianbiao, addTianbiao, updateTianbiao } from "@/api/tianbiao/tianbiao";

export default {
  name: "Tianbiao",
  dicts: ['sys_job_status', 'fromtype'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 填表管理表格数据
      tianbiaoList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        fromid: null,
        title: null,
        homeid: null,
        stuid: null,
        state: null,
        fromType: null,
        createtime: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询填表管理列表 */
    getList() {
      this.loading = true;
      listTianbiao(this.queryParams).then(response => {
        this.tianbiaoList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        fromid: null,
        title: null,
        fileurl: null,
        picurl: null,
        homeid: null,
        stuid: null,
        homename: null,
        stuname: null,
        state: null,
        fromType: null,
        createtime: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加填表管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getTianbiao(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改填表管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateTianbiao(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTianbiao(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除填表管理编号为"' + ids + '"的数据项？').then(function() {
        return delTianbiao(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('tianbiao/tianbiao/export', {
        ...this.queryParams
      }, `tianbiao_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
