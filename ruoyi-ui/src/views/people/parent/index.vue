<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="姓名" prop="pName">
        <el-input
          v-model="queryParams.pName"
          placeholder="请输入姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="性别" prop="pSex">
        <el-select v-model="queryParams.pSex" placeholder="请选择性别" clearable>
          <el-option
            v-for="dict in dict.type.sys_user_sex"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="住址" prop="pAddress">
        <el-input
          v-model="queryParams.pAddress"
          placeholder="请输入住址"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="手机号" prop="pPhone">
        <el-input
          v-model="queryParams.pPhone"
          placeholder="请输入手机号"
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
          v-hasPermi="['people:parent:add']"
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
          v-hasPermi="['people:parent:edit']"
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
          v-hasPermi="['people:parent:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['people:parent:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table border v-loading="loading" :data="parentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="家长编号" align="center" prop="pId" />
      <el-table-column fixed label="姓名" align="center" prop="pName" />
      <el-table-column label="性别" align="center" prop="pSex">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.pSex"/>
        </template>
      </el-table-column>
      <el-table-column label="身份证" width="165px" align="center" prop="pSfz" />
      <el-table-column label="年龄" align="center" prop="pAge" />
      <el-table-column label="政治面貌" align="center" prop="pZzmm">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.society" :value="scope.row.pZzmm"/>
        </template>
      </el-table-column>
      <el-table-column label="住址" width="220px" align="center" prop="pAddress" />
      <el-table-column label="手机号" width="150px" align="center" prop="pPhone" />
      <el-table-column label="创建时间" align="center" prop="pCreateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.pCreateTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="孩子id" align="center" prop="pChildId" />
      <el-table-column label="操作" align="center" fixed="right" width="200px" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="default"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['people:parent:edit']"
          >修改</el-button>
          <el-button
            size="default"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['people:parent:remove']"
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

    <!-- 添加或修改Parent对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="姓名" prop="pName">
          <el-input v-model="form.pName" placeholder="请输入姓名" />
        </el-form-item>
        <el-form-item label="性别">
          <el-radio-group v-model="form.pSex">
            <el-radio
              v-for="dict in dict.type.sys_user_sex"
              :key="dict.value"
:label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="身份证" prop="pSfz">
          <el-input v-model="form.pSfz" placeholder="请输入身份证" />
        </el-form-item>
        <el-form-item label="年龄" prop="pAge">
          <el-input v-model="form.pAge" placeholder="请输入年龄" />
        </el-form-item>
        <el-form-item label="政治面貌" prop="pZzmm">
          <el-select v-model="form.pZzmm" placeholder="请选择政治面貌">
            <el-option
              v-for="dict in dict.type.society"
              :key="dict.value"
              :label="dict.label"
:value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="住址" prop="pAddress">
          <el-input v-model="form.pAddress" placeholder="请输入住址" />
        </el-form-item>
        <el-form-item label="手机号" prop="pPhone">
          <el-input v-model="form.pPhone" placeholder="请输入手机号" />
        </el-form-item>
        <el-form-item label="创建时间" prop="pCreateTime">
          <el-date-picker clearable
            v-model="form.pCreateTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择创建时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="孩子id" prop="pChildId">
          <el-input v-model="form.pChildId" placeholder="请输入孩子id" />
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
import { listParent, getParent, delParent, addParent, updateParent } from "@/api/people/parent";

export default {
  name: "Parent",
  dicts: ['society', 'sys_user_sex'],
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
      // Parent表格数据
      parentList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        pName: null,
        pSex: null,
        pAddress: null,
        pPhone: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        pName: [
          { required: true, message: "姓名不能为空", trigger: "blur" }
        ],
        pSex: [
          { required: true, message: "性别不能为空", trigger: "blur" }
        ],
        pPhone: [
          { required: true, message: "手机号不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询Parent列表 */
    getList() {
      this.loading = true;
      listParent(this.queryParams).then(response => {
        this.parentList = response.rows;
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
        pId: null,
        pName: null,
        pSex: "0",
        pSfz: null,
        pAge: null,
        pZzmm: null,
        pAddress: null,
        pPhone: null,
        pCreateTime: null,
        pChildId: null
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
      this.ids = selection.map(item => item.pId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加Parent";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const pId = row.pId || this.ids
      getParent(pId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改Parent";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.pId != null) {
            updateParent(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addParent(this.form).then(response => {
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
      const pIds = row.pId || this.ids;
      this.$modal.confirm('是否确认删除Parent编号为"' + pIds + '"的数据项？').then(function() {
        return delParent(pIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('people/parent/export', {
        ...this.queryParams
      }, `parent_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
