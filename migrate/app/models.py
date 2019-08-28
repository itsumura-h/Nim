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

# 選考ステータス
class SelectionStatus(models.Model):
    name = models.CharField(max_length=255)

# 求職者
class Aplicant(models.Model):
    email = models.CharField(max_length=255)
    password = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    birth_date = models.DateField()
    address = models.CharField(max_length=255)
    phone_number = models.CharField(max_length=255)
    status = models.ForeignKey(SelectionStatus, models.PROTECT)

# 選考フロー
class Selection(models.Model):
    aplicant = models.ForeignKey(Aplicant, models.PROTECT)
    interviewer = models.ForeignKey(Employee, models.PROTECT)
    datetime = models.DateTimeField()
    result = models.BooleanField()

# 入社手続き
# 