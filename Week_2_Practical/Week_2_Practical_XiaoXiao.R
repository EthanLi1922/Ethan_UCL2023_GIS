### distinct()函数
# 创建一个包含重复行的数据框
df <- data.frame(
  Name = c("Alice", "Bob", "Alice", "Charlie", "Bob"),
  Age = c(25, 30, 25, 22, 30)
)
# 使用distinct()函数选择唯一的行
unique_rows <- distinct(df, Name, Age)
# 输出结果
print(unique_rows)



### mutate()函数
# `mutate()` 函数是 `dplyr` 包中的一个功能强大的函数，
# 用于在数据框中创建新的变量（列），这些变量通常是基于现有列进行计算得到的。
# `mutate()` 函数的主要作用是添加新的列，也可以用于修改现有列。

#`mutate()` 函数的基本语法如下：
mutate(data_frame, new_column_name = expression)
# `data_frame`：要操作的数据框。
# `new_column_name`：新的列名，用于存储计算结果。
# `expression`：计算新列的表达式，通常基于已有的列进行操作。

# 通过 `mutate()` 函数，你可以执行各种数学运算、逻辑运算、字符串操作等，以便根据现有列的值创建新的列:

# 1.基于现有列的数学运算：
mutate(data, new_column = old_column1 + old_column2)
# 2.基于现有列的逻辑运算：
mutate(data, new_column = ifelse(old_column > threshold, "Yes", "No"))
# 3.基于现有列的字符串操作：
mutate(data, new_column = paste("Prefix_", old_column, "_Suffix"))
# 基于现有列的函数操作：
mutate(data, new_column = sqrt(old_column))



### group_by()函数
# 在R的`dplyr`包中，`group_by()`函数用于按照一个或多个列对数据进行分组。
# 它将数据分割成不同的组，以便后续对各个组进行分析、汇总或可视化。

# `group_by()`函数的基本语法如下：
group_by(data, column_name1, column_name2, ...)
# `data`：要操作的数据框。
# `column_name1, column_name2, ...`：用于分组的列名。

# 通过`group_by()`函数，你可以指定一个或多个列名，将数据框按照这些列的不同取值分成多个组。
#一旦数据被分组，你可以在每个组内使用`summarise()`、`mutate()`、`filter()`等函数进行进一步的数据处理。

# 以下是一个示例，说明了`group_by()`函数的使用：
# 创建一个数据框
data <- data.frame(
  Category = c("A", "B", "A", "B", "A", "B"),
  Value = c(10, 15, 12, 18, 11, 16)
)

# 使用group_by()将数据按照Category列分组
grouped_data <- group_by(data, Category)

# 对每个组计算平均值
summary_data <- summarise(grouped_data, Average_Value = mean(Value))

# 输出结果
print(summary_data)

# 在这个示例中，数据框被按照`Category`列分组，然后`summarise()`函数计算了每个组内`Value`列的平均值。
# `group_by()`函数的结果是一个分组的数据框，可以在该数据框上进行各种操作。



### summarise()函数：
# `summarise()` 函数是 `dplyr` 包中的一个函数，用于对数据框进行聚合操作。
# 它的主要作用是根据数据的分组情况，计算每个组的统计摘要量，例如总和、均值、中位数、标准差等。

# `summarise()` 函数的基本语法如下：
summarise(data, new_column_name = function_to_apply(old_column))
# `data`：要操作的数据框。
# `new_column_name`：新的列名，用于存储计算结果。
# `function_to_apply(old_column)`：应用于现有列的聚合函数。

# 通过 `summarise()` 函数，你可以使用各种聚合函数来计算分组数据的摘要统计信息。
# 以下是一些常见的聚合函数及其作用：

# `sum()`: 计算总和。
# `mean()`: 计算均值。
# `median()`: 计算中位数。
# `min()`: 计算最小值。
# `max()`: 计算最大值。
# `sd()`: 计算标准差。
# `var()`: 计算方差。
# `n()`: 计算行数（即计数）。

# 以下是一个示例用法：
# 假设有一个数据框 `data`，你可以使用 `summarise()` 计算 `column_name` 列的均值：
result <- summarise(data, new_column_name = mean(column_name))
# 在这个示例中，`summarise()` 函数计算了 `data` 数据框中 `column_name` 列的均值，
# 并将结果存储在名为 `new_column_name` 的新列中。



### across()函数
`across()` 函数是 `dplyr` 包中的一个函数，用于在多个列上同时应用相同的变换操作。它的主要作用是提供一种方便的方法，可以对数据框中的多列进行相似的操作，而无需逐一指定列名。

`across()` 函数的基本语法如下：

```r
across(.cols = everything(), .fns, ..., .names = NULL)
```

- `.cols`：一个描述要操作的列的选择器。默认值是 `everything()`，表示应用操作到所有列。你也可以使用 `vars()`、`starts_with()`、`ends_with()`、`matches()` 等函数来指定要操作的列。
- `.fns`：一个或多个函数，用于对指定的列进行变换。
- `...`：可选参数，用于传递给被应用函数的额外参数。
- `.names`：一个可选参数，用于为生成的新列指定列名。

以下是一个示例用法，假设有一个数据框 `data`，你想要对其中的所有数值列应用 `log()` 函数：

```r
library(dplyr)

result <- data %>%
  mutate(across(where(is.numeric), ~ log(.)))
```

在这个示例中，`across()` 函数将 `log()` 函数应用到 `data` 数据框中的所有数值列（使用 `where(is.numeric)` 来选择所有数值列），然后 `mutate()` 函数将结果存储在新的数据框 `result` 中。

通过 `across()` 函数，你可以更灵活地操作多列数据，而不需要逐一列举每一列的名称。
















