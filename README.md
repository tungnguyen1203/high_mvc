# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# high_level_design_pattern
- High-level Architecture MVC ( 7 bộ phận )

  Controller

  Form
  
  Operation
  
  Model
  
  View
  
  Decorator

  Application Helper

	1. Controller

		○ Đảm nhiệm vai trò điều hướng, 

		○ Nhận output từ Opreration

		○ Xử lí flash message nếu có
	2. Operation

		○ Xử lí logic STEP BY STEP (mỗi function đơn nhiệm)

		○ Các method đều được gọi ở hàm call, bắt đầu từ prefix "_step"

		○ Sau "step_validation", không sử dụng params mà sử dụng attibutes ở 
    form

	3. Form

		○ Xử lí validate dữ liệu đầu vào, được gọi trong Operation

	4. Model

		○ Chỉ thể hiện quan hệ, scope, không xử lí logic

		○ Nếu buộc phải xử lí logic: tạo module Concern ( Ứng với model ).  Với suffix _finder.rb. Include vào model

	5. View

		○ Nên tạo folder chia theo dạng component, tách partial theo từng 
    componet.

	6. Decorate

		○ Dùng để xử lí logic cho view

	7. Application Helper

		○ Dùng để viết các method dùng lại nhiều lần. Phạm vi sử dụng toàn project
# Block, proc, lambda

## Block là một khối lệnh được đặt trong
```ruby
do ... end (dành cho nhiều dòng lệnh)
 hoặc
{...} (dành cho 1 dòng lệnh)
``` 
ex:
```ruby
	def hi(&block)
		block.call
	end

	hi{ p "heloo"}
	
	có thể thay &block bằng yield

	def hi
		yield
	end

	hi{ p "heloo"}

	kết hàm trên có kq như nhau
	=> heloo
```
## Proc:
tương tự như block nhưng sẽ giải quyết được vấn đề trùng lặp code của block và proc co thể đứng độc lập
- Là một object

ex:
```ruby
	m = [1,3,4]
	n = [4, 5, 6]
	def arr(x)
		yield x+2
	end

m.map{ |x| arr(x) { |x| p x}}
n.map{ |x| arr(x) { |x| p x}} 
# xử lí như nhau nhưng bị trùng code

# rút gọn code bằng cách sử dụng proc
proc =Proc.new { |x| p x +2}
  	m.map(&proc)
	n.map(&proc)

```
## Lambda 
Lambda là một function và không có tên cụ thể

- Là 1 object
- Dùng để gán 1 đoạn code

ex:
```ruby
	m = [1,3,4]
	lambda = lambda { |x| p x +2}

	m.map(&lambda)
```

## Sự khác nhau giữa Block và Proc
Proc là objects, còn block thì không

1 proc là thể hiện của 1 lớp Proc

Block chỉ là một phần trong hàm (từng dòng lệnh một), không có ý nghĩa gì nếu đứng độc lập

## Sự khác nhau giữa Proc và Lambda
Lambda chính là một đối tượng của Proc

lambda kiểm tra số lượng các tham số của nó nhận và trả về một ArgumentError nếu số lượng đó không phù hợp với số lượng đối số trong method của nó; còn Proc thì không, nếu không truyền tham số thì proc mặc định tham số đó bằng nil


Đối với hàm dùng return trong lambda và proc thì với proc thì sẽ return ngay sau khi thực hiện xong proc, còn với lambda thì vẫn tiếp tục chạy hết hàm sau khi gọi xong lambda

## form_for, form_with, form_tag

Khi muốn tạo form mà không khởi tạo đối tượng ta dùng form_tag

ex:
```ruby
<%= form_tag animals_path do %>
	<%= text_field_tag :name %>
  <%= submit_tag %>
<% end %>
```
Khi có đối tượng để thêm mới hoặc cập nhật thì dùng form_for

```ruby
<%= form_for @animals do |f| %>
	<%= f.text_field :name %>
  <%= f.submit %>
<% end %>
```
 Khi thì form_for, khi thì form_tag, form_with sinh ra để thuận tiện hơn trong việc viết code để ít sai cú pháp hơn.
  
Với form_with thì có thể
```ruby
# không truyền vào đối tượng
<%= form_with url: animals_path do |f| %>
  <%= f.text_field :name %>
  <%= f.submit %>
<% end %>
```

```ruby
# truyền vào đối tượng
<%= form_with model: @animals do |f| %>
  <%= f.text_field :name %>
  <%= f.submit %>
<% end %>

Có thể thêm các đối số như scope hay url.
```
>>	với form_tag và form_for thì không mặc định chế đội **remote** và ngược lại















