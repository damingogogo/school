<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="学号" prop="sXh">
        <el-input
          v-model="queryParams.sXh"
          placeholder="请输入学号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="姓名" prop="sName">
        <el-input
          v-model="queryParams.sName"
          placeholder="请输入姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item style="padding-left: 20px" label="性别" prop="sSex">
        <el-select v-model="queryParams.sSex" placeholder="请选择性别" clearable>
          <el-option
            v-for="dict in dict.type.sys_user_sex"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item style="padding-left: 20px" label="政治面貌" prop="sPolitic">
        <el-select v-model="queryParams.sPolitic" placeholder="请选择政治面貌" clearable>
          <el-option
            v-for="dict in dict.type.society"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item style="padding-left: 20px" label="家庭住址" prop="sAddress">
        <el-input
          v-model="queryParams.sAddress"
          placeholder="请输入家庭住址"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item style="padding-left: 10px" label="学校名称" prop="sSchool">
        <el-input
          v-model="queryParams.sSchool"
          placeholder="请输入学校名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item style="padding-left: 5px" label="学院名称" prop="sCollege">
        <el-select v-model="queryParams.sCollege" placeholder="请选择学院名称" clearable>
          <el-option
            v-for="dict in dict.type.college"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item style="padding-left: 20px" label-width="6rem" label="所在系名称" prop="sDept">
        <el-select style="padding-left: 20px" v-model="queryParams.sDept" placeholder="请选择所在系名称" clearable>
          <el-option
            v-for="dict in dict.type.dep"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="年级" prop="sGrade">
        <el-select v-model="queryParams.sGrade" placeholder="请选择年级" clearable>
          <el-option
            v-for="dict in dict.type.stu_nianji"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="班级" prop="sClass">
        <el-select v-model="queryParams.sClass" placeholder="请选择班级" clearable>
          <el-option
            v-for="dict in dict.type.stu_class"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label-width="6rem" label="班主任姓名" prop="sMaster">
        <el-input
          v-model="queryParams.sMaster"
          placeholder="请输入班主任姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label-width="6rem" label="监护人姓名" prop="sParent">
        <el-input
          v-model="queryParams.sParent"
          placeholder="请输入监护人姓名"
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
          v-hasPermi="['people:student:add']"
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
          v-hasPermi="['people:student:edit']"
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
          v-hasPermi="['people:student:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['people:student:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table border v-loading="loading" :data="studentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="50" align="center" />
<!--      <el-table-column label="ID" width="50" align="center" prop="sId" />-->
      <el-table-column fixed label="姓名" width="90" align="center" prop="sName" />
      <el-table-column label="学号" width="120" align="center" prop="sXh" />
      <el-table-column label="身份证号" width="160" align="center" prop="sSfz" />
      <el-table-column label="性别" align="center" prop="sSex">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.sSex"/>
        </template>
      </el-table-column>
      <el-table-column label="年龄" align="center" prop="sAge" />
      <el-table-column label="民族" align="center" prop="sNation" />
      <el-table-column label="政治面貌" align="center" prop="sPolitic">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.society" :value="scope.row.sPolitic"/>
        </template>
      </el-table-column>
      <el-table-column label="邮箱" width="160" align="center" prop="sEmail" />
      <el-table-column label="电话" width="130" align="center" prop="sPhone" />
      <el-table-column label="家庭住址" width="180" align="center" prop="sAddress" />
      <el-table-column label="学校名称" width="100" align="center" prop="sSchool" />
      <el-table-column label="学院名称" width="100"  align="center" prop="sCollege">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.college" :value="scope.row.sCollege"/>
        </template>
      </el-table-column>
      <el-table-column width="150px" label="所在系名称" align="center" prop="sDept">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.dep" :value="scope.row.sDept"/>
        </template>
      </el-table-column>
      <el-table-column label="年级" align="center" prop="sGrade">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.stu_nianji" :value="scope.row.sGrade"/>
        </template>
      </el-table-column>
      <el-table-column label="班级" width="120" align="center" prop="sClass">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.stu_class" :value="scope.row.sClass"/>
        </template>
      </el-table-column>
      <el-table-column label="班主任姓名" width="100"  align="center" prop="sMaster" />
      <el-table-column label="监护人姓名" width="100"  align="center" prop="sParent" />
      <el-table-column label="操作" align="center" fixed="right" width="200" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="default"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['people:student:edit']"
          >修改</el-button>
          <el-button
            size="default"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['people:student:remove']"
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

    <!-- 添加或修改student对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="学号" prop="sXh">
          <el-input v-model="form.sXh" placeholder="请输入学号" />
        </el-form-item>
        <el-form-item label="姓名" prop="sName">
          <el-input v-model="form.sName" placeholder="请输入姓名" />
        </el-form-item>
        <el-form-item label="身份证号" prop="sSfz">
          <el-input v-model="form.sSfz" placeholder="请输入身份证号" />
        </el-form-item>
        <el-form-item label="性别">
          <el-radio-group v-model="form.sSex">
            <el-radio
              v-for="dict in dict.type.sys_user_sex"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="年龄" prop="sAge">
          <el-input v-model="form.sAge" placeholder="请输入年龄" />
        </el-form-item>
        <el-form-item label="民族" prop="sNation">
          <el-input v-model="form.sNation" placeholder="请输入民族" />
        </el-form-item>
        <el-form-item label="政治面貌">
          <el-radio-group v-model="form.sPolitic">
            <el-radio
              v-for="dict in dict.type.society"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="邮箱" prop="sEmail">
          <el-input v-model="form.sEmail" placeholder="请输入邮箱" />
        </el-form-item>
        <el-form-item label="电话" prop="sPhone">
          <el-input v-model="form.sPhone" placeholder="请输入电话" />
        </el-form-item>
        <el-form-item label="家庭住址" prop="sAddress">
          <el-input v-model="form.sAddress" placeholder="请输入家庭住址" />
        </el-form-item>
        <el-form-item label="学校名称" prop="sSchool">
          <el-input v-model="form.sSchool" placeholder="请输入学校名称" />
        </el-form-item>
        <el-form-item label="学院名称" prop="sCollege">
          <el-select v-model="form.sCollege" placeholder="请选择学院名称">
            <el-option
              v-for="dict in dict.type.college"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="所在系名称" prop="sDept">
          <el-select v-model="form.sDept" placeholder="请选择所在系名称">
            <el-option
              v-for="dict in dict.type.dep"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="年级" prop="sGrade">
          <el-select v-model="form.sGrade" placeholder="请选择年级">
            <el-option
              v-for="dict in dict.type.stu_nianji"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="班级" prop="sClass">
          <el-select v-model="form.sClass" placeholder="请选择班级">
            <el-option
              v-for="dict in dict.type.stu_class"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="班主任姓名" prop="sMaster">
          <el-input v-model="form.sMaster" placeholder="请输入班主任姓名" />
        </el-form-item>
        <el-form-item label="监护人姓名" prop="sParent">
          <el-input v-model="form.sParent" placeholder="请输入监护人姓名" />
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
import { listStudent, getStudent, delStudent, addStudent, updateStudent } from "@/api/people/student";

export default {
  name: "Student",
  dicts: ['stu_nianji', 'stu_class', 'college', 'society', 'sys_user_sex', 'dep'],
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
      // student表格数据
      studentList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        sXh: null,
        sName: null,
        sSex: null,
        sPolitic: null,
        sAddress: null,
        sSchool: null,
        sCollege: null,
        sDept: null,
        sGrade: null,
        sClass: null,
        sMaster: null,
        sParent: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        sXh: [
          { required: true, message: "学号不能为空", trigger: "blur" }
        ],
        sSex: [
          { required: true, message: "性别不能为空", trigger: "blur" }
        ],
        sNation: [
          { required: true, message: "民族不能为空", trigger: "blur" }
        ],
        sEmail: [
          { required: true, message: "邮箱不能为空", trigger: "blur" }
        ],
        sPhone: [
          { required: true, message: "电话不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询student列表 */
    getList() {
      this.loading = true;
      listStudent(this.queryParams).then(response => {
        this.studentList = response.rows;
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
        sId: null,
        sName: null,
        sXh: null,
        sSfz: null,
        sSex: "0",
        sAge: null,
        sNation: null,
        sPolitic: "0",
        sEmail: null,
        sPhone: null,
        sAddress: null,
        sSchool: null,
        sCollege: null,
        sDept: null,
        sGrade: null,
        sClass: null,
        sMaster: null,
        sParent: null
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
      this.ids = selection.map(item => item.sId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加student";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const sId = row.sId || this.ids
      getStudent(sId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改student";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.sId != null) {
            updateStudent(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addStudent(this.form).then(response => {
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
      const sIds = row.sId || this.ids;
      this.$modal.confirm('是否确认删除student编号为"' + sIds + '"的数据项？').then(function() {
        return delStudent(sIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('people/student/export', {
        ...this.queryParams
      }, `student_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
