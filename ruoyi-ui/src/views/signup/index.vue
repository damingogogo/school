<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="报名ID" prop="applyid">
        <el-input
          v-model="queryParams.applyid"
          placeholder="请输入报名ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学生ID" prop="stuId">
        <el-input
          v-model="queryParams.stuId"
          placeholder="请输入学生ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="报名类别" prop="typeApply">
        <el-select v-model="queryParams.typeApply" placeholder="请选择报名类别" clearable>
          <el-option
            v-for="dict in dict.type.baomin"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="创建时间" prop="createDay">
        <el-date-picker clearable
                        v-model="queryParams.createDay"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="状态" prop="state">
        <el-select v-model="queryParams.state" placeholder="请选择状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_job_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="报名描述" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入报名描述"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学生姓名" prop="stuname">
        <el-input
          v-model="queryParams.stuname"
          placeholder="请输入学生姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['signup:signup:add']"
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
          v-hasPermi="['signup:signup:edit']"
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
          v-hasPermi="['signup:signup:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['signup:signup:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="signupList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="报名ID" align="center" prop="applyid" />
      <el-table-column label="年级" align="center" prop="nianji">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.stu_nianji" :value="scope.row.nianji"/>
        </template>
      </el-table-column>
      <el-table-column label="班级" align="center" prop="classid">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.stu_class" :value="scope.row.classid"/>
        </template>
      </el-table-column>
      <el-table-column label="报名类别" align="center" prop="typeApply">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.baomin" :value="scope.row.typeApply"/>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createDay" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createDay, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="state">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_job_status" :value="scope.row.state"/>
        </template>
      </el-table-column>
      <el-table-column label="报名描述" align="center" prop="title" />
      <el-table-column label="备注" align="center" prop="bz" />
      <el-table-column label="学生姓名" align="center" prop="stuname" />
      <el-table-column label="操作" align="center"  width="200" fixed="right" class-name="small-padding fixed-width">
        <template   slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['signup:signup:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['signup:signup:remove']"
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

    <!-- 添加或修改报名管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="报名ID" prop="applyid">
          <el-input v-model="form.applyid" placeholder="请输入报名ID" />
        </el-form-item>
        <el-form-item label="学生ID" prop="stuId">
          <el-input v-model="form.stuId" placeholder="请输入学生ID" />
        </el-form-item>
        <el-form-item label="年级" prop="nianji">
          <el-select v-model="form.nianji" placeholder="请选择年级">
            <el-option
              v-for="dict in dict.type.stu_nianji"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="班级" prop="classid">
          <el-select v-model="form.classid" placeholder="请选择班级">
            <el-option
              v-for="dict in dict.type.stu_class"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="报名类别" prop="typeApply">
          <el-select v-model="form.typeApply" placeholder="请选择报名类别">
            <el-option
              v-for="dict in dict.type.baomin"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="创建时间" prop="createDay">
          <el-date-picker clearable
                          v-model="form.createDay"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择创建时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="状态" prop="state">
          <el-select v-model="form.state" placeholder="请选择状态">
            <el-option
              v-for="dict in dict.type.sys_job_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="报名描述" prop="title">
          <el-input v-model="form.title" placeholder="请输入报名描述" />
        </el-form-item>
        <el-form-item label="备注" prop="bz">
          <el-input v-model="form.bz" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="学生姓名" prop="stuname">
          <el-input v-model="form.stuname" placeholder="请输入学生姓名" />
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
import { listSignup, getSignup, delSignup, addSignup, updateSignup } from "@/api/signup/signup";

export default {
  name: "Signup",
  dicts: ['stu_nianji', 'stu_class', 'sys_job_status', 'baomin'],
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
      // 报名管理表格数据
      signupList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        applyid: null,
        stuId: null,
        typeApply: null,
        createDay: null,
        state: null,
        title: null,
        stuname: null
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
    /** 查询报名管理列表 */
    getList() {
      this.loading = true;
      listSignup(this.queryParams).then(response => {
        this.signupList = response.rows;
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
        applyid: null,
        stuId: null,
        nianji: null,
        classid: null,
        typeApply: null,
        createDay: null,
        state: null,
        title: null,
        bz: null,
        stuname: null
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
      this.title = "添加报名管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getSignup(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改报名管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateSignup(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSignup(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除报名管理编号为"' + ids + '"的数据项？').then(function() {
        return delSignup(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('signup/signup/export', {
        ...this.queryParams
      }, `signup_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
