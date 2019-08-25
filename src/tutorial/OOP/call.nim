# from ValueObjects import ValueObjects
import ValueObjects
include ValueObjects

var nameVO = NameValueObjet(value: "taro")
echo nameVO.get_label()
echo nameVO.value