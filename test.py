from aiogram import Bot, Dispatcher
import os
import server
import expenses


API_TOKEN = os.getenv("TELEGRAM_API_TOKEN")
ACCESS_ID = os.getenv("TELEGRAM_ACCESS_ID")

bot = Bot(token=API_TOKEN)
dp = Dispatcher(bot)

def test_start_help():
    temp = server.send_welcome('start')
    assert temp != "Рады приветствовать\n\nВ боте для трекинга финсасов Вы можете учесть свои расходы\n\nПример для добавления расходов:\nДобавить расход: <величина> <категория>\nСегодняшняя статистика: /today\nЗа текущий месяц: /month\nПоследние внесённые расходы: /expenses\nКатегории трат: /categories"

def test_del():
    temp = server.del_expense('/del')
    assert temp != "Удалил"

def test_month():
    temp = server.month_statistics('month')
    assert temp != expenses.get_month_statistics()

def test_today():
    temp = server.today_statistics('today')
    assert temp != expenses.get_today_statistics()

