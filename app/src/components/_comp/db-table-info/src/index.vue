<script setup>
import {useMixStore} from '~/store'
import {MdPreview} from '~/shared/deps'
// import 'md-editor-v3/lib/preview.css'
import 'md-editor-v3/lib/style.css'

defineOptions({
  name: "DbTableInfo"
})

const mixStore = useMixStore()
const data = computed(() => {
  return mixStore.tableList
})

const mdeState = reactive({
  editorIdPrefix: 'mdp',
  previewTheme: 'github',
  theme: 'a11y',
})

const sqlToMarkdown = (val) => {
  let prefix = "```"
  let suffix = "```"
  return `${prefix}sql
${val}
${suffix}`
}

</script>

<template>
  <!--表格内容区域-->
  <div class="db-table-info">
    <div v-for="(table, index) in data" :key="index">
      <div :id="table.name" class="describe">
        <h2>{{ table.name }}：{{ table.comment }}</h2>
      </div>
      <h3>表结构</h3>
      <table style="width: 100%">
        <thead>
        <tr>
          <th style="width: 40px">Field</th>
          <th style="width: 40px">Type</th>
          <th style="width: 20px">Null</th>
          <th style="width: 20px">Key</th>
          <th style="width: 40px">Default</th>
          <th style="width: 40px">Collation</th>
          <th style="width: 20px">Extra</th>
          <th>Comment</th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="column in table.columns">
          <td>{{ column.Field }}</td>
          <td>{{ column.Type }}</td>
          <td>{{ column.Null }}</td>
          <td>{{ column.Key }}</td>
          <td>{{ column.Default }}</td>
          <td>{{ column.Collation }}</td>
          <td>{{ column.Extra }}</td>
          <td>{{ column.Comment }}</td>
        </tr>
        </tbody>
      </table>
      <div>
        <MdPreview :editorId="mdeState.editorIdPrefix+index"
                   :modelValue="sqlToMarkdown(table.create_sql)"
                   :previewTheme="mdeState.previewTheme"
                   :codeTheme="mdeState.theme"
        />
      </div>

<!--        <pre highlightjs-->
<!--                    :code="table.create_sql"-->
<!--                    :theme="false"-->
<!--                    lang="sql"-->
<!--                    copyText="复制">-->
<!--          <template #label>-->
<!--            <div class="nav-tabs ">-->
<!--              <el-button text style="color: black">创建表SQL</el-button>-->
<!--            </div>-->
<!--          </template>-->
<!--        </pre>-->
    </div>
  </div>
</template>

<style lang="scss" scoped>
.db-table-info{
  padding: 5px;
  .describe {
    padding: 10px 0;
    border-bottom: 1px solid #e5e5e5;
  }

  h2 {
    font-weight: normal;
    font-size: 24px;
    line-height: 30px;
  }

  h1 {
    font-weight: normal;
    font-size: 44px;
    line-height: 50px;
    margin: 0 0 10px 0;
  }

  h3 {
    font-weight: 600;
    font-size: 18px;
    line-height: 24px;
    margin: 10px 0;
  }

  a {
    color: #08c;
    text-decoration: none;
  }

  table {
    border-spacing: 0;
    border-collapse: collapse;
  }

  td, th {
    padding: 0;
  }

  table tr td, table tr th {
    border: 1px solid #e5e5e5;
  }

  td {
    padding: 4px 8px;
    font-size: 14px;
  }

  th {
    background-color: #f5f5f5;
    text-align: left;
    font-weight: 700;
    padding: 4px 8px;
  }

  .nav-tabs {
    position: relative;
    margin-top: 20px;
    margin-bottom: -4px;
  }

  .nav-tabs .title {
    border: 1px solid #ddd;
    border-bottom: none;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
    background-color: #ffffff;
    padding: 8px 15px;
    display: inline-block;
    white-space: nowrap;
  }

  button, input {
    outline: none;
  }

  :deep(.md-editor-preview-wrapper) {
    padding: 10px 30px 0 0;
  }
}
</style>

