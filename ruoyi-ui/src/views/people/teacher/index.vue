<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="姓名" prop="tName">
        <el-input
          v-model="queryParams.tName"
          placeholder="请输入姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="工号" prop="tGonghao">
        <el-input
          v-model="queryParams.tGonghao"
          placeholder="请输入工号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="邮箱" prop="tEmail">
        <el-input
          v-model="queryParams.tEmail"
          placeholder="请输入邮箱"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="手机号" prop="tPhone">
        <el-input
          v-model="queryParams.tPhone"
          placeholder="请输入手机号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="家庭住址" prop="tAddress">
        <el-input
          v-model="queryParams.tAddress"
          placeholder="请输入家庭住址"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="疫苗接种" prop="yimiao">
        <el-select v-model="queryParams.yimiao" placeholder="请选择疫苗接种" clearable>
          <el-option
            v-for="dict in dict.type.yimiao"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
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
          v-hasPermi="['people:teacher:add']"
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
          v-hasPermi="['people:teacher:edit']"
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
          v-hasPermi="['people:teacher:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['people:teacher:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table border v-loading="loading" :data="teacherList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55px" align="center" />
      <el-table-column label="教师ID" width="80px" align="center" prop="tId" />
      <el-table-column fixed label="姓名" align="center" width="100px" prop="tName" />
      <el-table-column label="工号" align="center" width="80px" prop="tGonghao" />
      <el-table-column label="性别" align="center" width="60px" prop="tSex">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.tSex"/>
        </template>
      </el-table-column>
      <el-table-column label="身份证" align="center" width="180px" prop="tSfz" />
      <el-table-column label="年龄" align="center" width="50px" prop="tAge" />
      <el-table-column label="政治面貌" align="center" width="90px" prop="tPolitic">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.society" :value="scope.row.tPolitic"/>
        </template>
      </el-table-column>
      <el-table-column label="民族" align="center" width="70px" prop="tNation" />
      <el-table-column label="邮箱" align="center" width="160px" prop="tEmail" />
      <el-table-column label="手机号" align="center" width="160px" prop="tPhone" />
      <el-table-column label="家庭住址" align="center" width="250px" prop="tAddress" />
      <el-table-column label="疫苗接种" align="center" width="160px" prop="yimiao">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.yimiao" :value="scope.row.yimiao"/>
        </template>
      </el-table-column>
      <el-table-column label="任课学院" align="center" width="160px" prop="collegeType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.college" :value="scope.row.collegeType ? scope.row.collegeType.split(',') : []"/>
        </template>
      </el-table-column>
      <el-table-column label="任课系" align="center" width="160px" prop="tDep">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.dep" :value="scope.row.tDep ? scope.row.tDep.split(',') : []"/>
        </template>
      </el-table-column>
      <el-table-column label="任课年级" align="center" width="160px" prop="gradeType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.stu_nianji" :value="scope.row.gradeType ? scope.row.gradeType.split(',') : []"/>
        </template>
      </el-table-column>
      <el-table-column label="任课班级" align="center" width="180px" prop="classType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.stu_class" :value="scope.row.classType ? scope.row.classType.split(',') : []"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center"  fixed="right" width="200" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="default"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['people:teacher:edit']"
          >修改</el-button>
          <el-button
            size="default"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['people:teacher:remove']"
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

    <!-- 添加或修改Teacher对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="姓名" prop="tName">
          <el-input v-model="form.tName" placeholder="请输入姓名" />
        </el-form-item>
        <el-form-item label="工号" prop="tGonghao">
          <el-input v-model="form.tGonghao" placeholder="请输入工号" />
        </el-form-item>
        <el-form-item label="性别">
          <el-radio-group v-model="form.tSex">
            <el-radio
              v-for="dict in dict.type.sys_user_sex"
              :key="dict.value"
:label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="身份证" prop="tSfz">
          <el-input v-model="form.tSfz" placeholder="请输入身份证" />
        </el-form-item>
        <el-form-item label="年龄" prop="tAge">
          <el-input v-model="form.tAge" placeholder="请输入年龄" />
        </el-form-item>
        <el-form-item label="政治面貌" prop="tPolitic">
          <el-select v-model="form.tPolitic" placeholder="请选择政治面貌">
            <el-option
              v-for="dict in dict.type.society"
              :key="dict.value"
              :label="dict.label"
:value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="民族" prop="tNation">
          <el-input v-model="form.tNation" placeholder="请输入民族" />
        </el-form-item>
        <el-form-item label="邮箱" prop="tEmail">
          <el-input v-model="form.tEmail" placeholder="请输入邮箱" />
        </el-form-item>
        <el-form-item label="手机号" prop="tPhone">
          <el-input v-model="form.tPhone" placeholder="请输入手机号" />
        </el-form-item>
        <el-form-item label="家庭住址" prop="tAddress">
          <el-input v-model="form.tAddress" placeholder="请输入家庭住址" />
        </el-form-item>
        <el-form-item label="疫苗接种" prop="yimiao">
          <el-select v-model="form.yimiao" placeholder="请选择疫苗接种">
            <el-option
              v-for="dict in dict.type.yimiao"
              :key="dict.value"
              :label="dict.label"
:value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="任课学院">
          <el-checkbox-group v-model="form.collegeType">
            <el-checkbox
              v-for="dict in dict.type.college"
              :key="dict.value"
              :label="dict.value">
              {{dict.label}}
            </el-checkbox>
          </el-checkbox-group>
        </el-form-item>
        <el-form-item label="任课系">
          <el-checkbox-group v-model="form.tDep">
            <el-checkbox
              v-for="dict in dict.type.dep"
              :key="dict.value"
              :label="dict.value">
              {{dict.label}}
            </el-checkbox>
          </el-checkbox-group>
        </el-form-item>
        <el-form-item label="任课年级">
          <el-checkbox-group v-model="form.gradeType">
            <el-checkbox
              v-for="dict in dict.type.stu_nianji"
              :key="dict.value"
              :label="dict.value">
              {{dict.label}}
            </el-checkbox>
          </el-checkbox-group>
        </el-form-item>
        <el-form-item label="任课班级">
          <el-checkbox-group v-model="form.classType">
            <el-checkbox
              v-for="dict in dict.type.stu_class"
              :key="dict.value"
              :label="dict.value">
              {{dict.label}}
            </el-checkbox>
          </el-checkbox-group>
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
import { listTeacher, getTeacher, delTeacher, addTeacher, updateTeacher } from "@/api/people/teacher";

export default {
  name: "Teacher",
  dicts: ['stu_nianji', 'stu_class', 'college', 'society', 'sys_user_sex', 'yimiao', 'dep'],
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
      // Teacher表格数据
      teacherList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        tName: null,
        tGonghao: null,
        tEmail: null,
        tPhone: null,
        tAddress: null,
        yimiao: null,
        collegeType: null,
        tDep: null,
        gradeType: null,
        classType: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        tName: [
          { required: true, message: "姓名不能为空", trigger: "blur" }
        ],
        tSex: [
          { required: true, message: "性别不能为空", trigger: "blur" }
        ],
        tEmail: [
          { required: true, message: "邮箱不能为空", trigger: "blur" }
        ],
        tPhone: [
          { required: true, message: "手机号不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询Teacher列表 */
    getList() {
      this.loading = true;
      listTeacher(this.queryParams).then(response => {
        this.teacherList = response.rows;
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
        tId: null,
        tName: null,
        tGonghao: null,
        tSex: "0",
        tSfz: null,
        tAge: null,
        tPolitic: null,
        tNation: null,
        tEmail: null,
        tPhone: null,
        tAddress: null,
        yimiao: null,
        collegeType: [],
        tDep: [],
        gradeType: [],
        classType: []
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
      this.ids = selection.map(item => item.tId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加Teacher";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const tId = row.tId || this.ids
      getTeacher(tId).then(response => {
        this.form = response.data;
        this.form.collegeType = this.form.collegeType.split(",");
        this.form.tDep = this.form.tDep.split(",");
        this.form.gradeType = this.form.gradeType.split(",");
        this.form.classType = this.form.classType.split(",");
        this.open = true;
        this.title = "修改Teacher";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.collegeType = this.form.collegeType.join(",");
          this.form.tDep = this.form.tDep.join(",");
          this.form.gradeType = this.form.gradeType.join(",");
          this.form.classType = this.form.classType.join(",");
          if (this.form.tId != null) {
            updateTeacher(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTeacher(this.form).then(response => {
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
      const tIds = row.tId || this.ids;
      this.$modal.confirm('是否确认删除Teacher编号为"' + tIds + '"的数据项？').then(function() {
        return delTeacher(tIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('people/teacher/export', {
        ...this.queryParams
      }, `teacher_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
