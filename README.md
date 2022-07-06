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
