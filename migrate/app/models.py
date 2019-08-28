from django.db import models

# Create your models here.

# サンプル権限
class SamplePermission(models.Model):
    def __str__(self):
        return str(self.permission)

    permission = models.CharField(max_length=255)

    class Meta:
        db_table = 'sample_permissions'  # テーブル名
        verbose_name_plural = 'SamplePermissions'  # 複数形の時の名前
# サンプルユーザー
class SampleUser(models.Model):
    def __str__(self):
        return str(self.name)

    name = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    password = models.CharField(max_length=255)
    permission = models.ForeignKey(SamplePermission, on_delete=models.PROTECT)
    birth_date = models.DateField()
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()

    class Meta:
        db_table = 'sample_users'
        verbose_name_plural = 'SampleUsers'    




# 部門
class Department(models.Model):
    name = models.CharField(max_length=255)

# 社員
class Employee(models.Model):
    email = models.CharField(max_length=255)
    password = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    birth_date = models.DateField()
    address = models.CharField(max_length=255)
    phone_number = models.CharField(max_length=255)
    department = models.ForeignKey(Department, models.PROTECT)

# 勤怠
class Calender(models.Model):
    pass

# 給与
class Salary(models.Model):
    employee = models.ForeignKey(Employee, models.PROTECT)
    year = models.IntegerField()
    month = models.IntegerField()
    work_time = models.IntegerField() # 分
    over_work_time = models.IntegerField() # 分

