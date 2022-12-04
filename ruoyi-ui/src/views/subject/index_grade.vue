<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="学生学号" prop="stuId">
        <el-input
          fixed="right"
          v-model="queryParams.stuId"
          placeholder="请输入学生学号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学生姓名" prop="stuName">
        <el-input
          v-model="queryParams.stuName"
          placeholder="请输入学生姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="班级" prop="stuClass">
        <el-select v-model="queryParams.stuClass" placeholder="请选择班级" clearable>
          <el-option
            v-for="dict in dict.type.stu_class"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="年级" prop="nianji">
        <el-select v-model="queryParams.nianji" placeholder="请选择年级" clearable>
          <el-option
            v-for="dict in dict.type.stu_nianji"
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
          v-hasPermi="['system:grade:add']"
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
          v-hasPermi="['system:grade:edit']"
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
          v-hasPermi="['system:grade:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:grade:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="gradeList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="学生ID" align="center" prop="stuId" />
      <el-table-column label="学生姓名" align="center" prop="stuName" />
      <el-table-column label="班级" align="center" prop="stuClass">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.stu_class" :value="scope.row.stuClass"/>
        </template>
      </el-table-column>
      <el-table-column label="年级" align="center" prop="nianji">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.stu_nianji" :value="scope.row.nianji"/>
        </template>
      </el-table-column>
      <el-table-column label="语文" align="center" prop="yuwen" />
      <el-table-column label="英语" align="center" prop="yingyu" />
      <el-table-column label="数学" align="center" prop="shuxue" />
      <el-table-column label="物理" align="center" prop="wuli" />
      <el-table-column label="化学" align="center" prop="huaxue" />
      <el-table-column label="生物" align="center" prop="shengwu" />
      <el-table-column label="政治" align="center" prop="zhenzi" />
      <el-table-column label="历史" align="center" prop="lishi" />
      <el-table-column label="地理" align="center" prop="dili" />
      <el-table-column label="音乐" align="center" prop="yingyue" />
      <el-table-column label="体育" align="center" prop="tiyu" />
      <el-table-column label="总分" align="center" prop="countNum" />
      <el-table-column label="操作" align="center"  width="200" fixed="right" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:grade:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:grade:remove']"
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

    <!-- 添加或修改syudent_grade对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="学生ID" prop="stuId">
          <el-input v-model="form.stuId" placeholder="请输入学生ID" />
        </el-form-item>
        <el-form-item label="学生姓名" prop="stuName">
          <el-input v-model="form.stuName" placeholder="请输入学生姓名" />
        </el-form-item>
        <el-form-item label="语文" prop="yuwen">
          <el-input v-model="form.yuwen" placeholder="请输入语文" />
        </el-form-item>
        <el-form-item label="英语" prop="yingyu">
          <el-input v-model="form.yingyu" placeholder="请输入英语" />
        </el-form-item>
        <el-form-item label="数学" prop="shuxue">
          <el-input v-model="form.shuxue" placeholder="请输入数学" />
        </el-form-item>
        <el-form-item label="物理" prop="wuli">
          <el-input v-model="form.wuli" placeholder="请输入物理" />
        </el-form-item>
        <el-form-item label="化学" prop="huaxue">
          <el-input v-model="form.huaxue" placeholder="请输入化学" />
        </el-form-item>
        <el-form-item label="生物" prop="shengwu">
          <el-input v-model="form.shengwu" placeholder="请输入生物" />
        </el-form-item>
        <el-form-item label="政治" prop="zhenzi">
          <el-input v-model="form.zhenzi" placeholder="请输入政治" />
        </el-form-item>
        <el-form-item label="历史" prop="lishi">
          <el-input v-model="form.lishi" placeholder="请输入历史" />
        </el-form-item>
        <el-form-item label="地理" prop="dili">
          <el-input v-model="form.dili" placeholder="请输入地理" />
        </el-form-item>
        <el-form-item label="音乐" prop="yingyue">
          <el-input v-model="form.yingyue" placeholder="请输入音乐" />
        </el-form-item>
        <el-form-item label="体育" prop="tiyu">
          <el-input v-model="form.tiyu" placeholder="请输入体育" />
        </el-form-item>
        <el-form-item label="总分" prop="countNum">
          <el-input v-model="form.countNum" placeholder="请输入总分" />
        </el-form-item>
        <el-form-item label="班级" prop="stuClass">
          <el-select v-model="form.stuClass" placeholder="请选择班级">
            <el-option
              v-for="dict in dict.type.stu_class"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
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
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listGrade, getGrade, delGrade, addGrade, updateGrade } from "@/api/subject/grade";

export default {
  name: "Grade",
  dicts: ['stu_nianji', 'stu_class'],
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
      // syudent_grade表格数据
      gradeList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        stuId: null,
        stuName: null,
        stuClass: null,
        nianji: null
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
    /** 查询syudent_grade列表 */
    getList() {
      this.loading = true;
      listGrade(this.queryParams).then(response => {
        this.gradeList = response.rows;
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
        stuId: null,
        stuName: null,
        yuwen: null,
        yingyu: null,
        shuxue: null,
        wuli: null,
        huaxue: null,
        shengwu: null,
        zhenzi: null,
        lishi: null,
        dili: null,
        yingyue: null,
        tiyu: null,
        countNum: null,
        stuClass: null,
        nianji: null
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
      this.title = "添加成绩";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getGrade(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改成绩";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateGrade(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addGrade(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除编号为"' + ids + '"的数据项？').then(function() {
        return delGrade(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/grade/export', {
        ...this.queryParams
      }, `grade_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
