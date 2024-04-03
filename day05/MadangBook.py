# 파이썬 DB 연동 프로그램

import sys
from PyQt5 import uic
from PyQt5.QtCore import Qt
from PyQt5.QtGui import QCloseEvent
from PyQt5.QtWidgets import *
from PyQt5.QtGui import *
import webbrowser
## MSSQL 연동할 라이브러리(모듈)
import pymssql as db

from PyQt5.QtWidgets import QWidget

class qtApp(QMainWindow):
    def __init__(self) -> None:
        super().__init__()
        uic.loadUi('./day05/MadangBook.ui', self)
        self.initUI()

    def initUI(self) -> None:
        # Button 4개에 대해서 사용등록
        self.btnNew.clicked.connect(self.btnNew_clicked)    # 신규버튼 시그널(이벤트)에 대한 슬롯함수 생성
        self.btnSave.clicked.connect(self.btnSave_clicked)  # 저장버튼
        self.btnDel.clicked.connect(self.btnDel_clicked)    # 삭제버튼
        self.btnReload.clicked.connect(self.btnReload_clicked)    # 조회버튼
        self.tblBooks.itemSelectionChanged.connect(self.tblBooksSelected) # 테이블 위젯 결과를 클릭시 발생
        self.show()

    def btnNew_clicked(self): # 신규버튼 클릭
       # QMessageBox.about(self, '버튼', '신규버튼이 클릭됨')
        conn = db.connect(server='127.0.0.1', user= 'sa', password= 'mssql_p@ss', database='Madang', charset='EUC-KR')
        cursor = conn.cursor(as_dict=True)

        cursor.execute('SELECT * FROM Book')
        for row in cursor:
            print(f'bookid={row["bookid"]}, bookname={row["bookname"]}, publisher={row["publisher"]}, price={row["price"]}')

        conn.close()

    def btnSave_clicked(self): # 저장버튼 클릭
        QMessageBox.about(self, '버튼', '저장버튼이 클릭됨')

    def btnDel_clicked(self): # 삭제버튼 클릭
        QMessageBox.about(self, '버튼', '삭제버튼이 클릭됨')

    def btnReload_clicked(self): # 조회버튼 클릭
        QMessageBox.about(self, '버튼', '조회버튼이 클릭됨')

    def tblBooksSelected(self): # 조회 결과 테이블위젯 내용 클릭
        QMessageBox.about(self, '테이블위젯', '내용 변경')

    #원래 PyQt 있는 함수 closeEvent를 재정의(Override)
    def closeEvent(self, event) -> None:
        re = QMessageBox.question(self, '종료여부', '종료하시겠습니까?', QMessageBox.Yes, QMessageBox.No)
        if re == QMessageBox.Yes:
            event.accept() # 완전히 꺼짐
        else:
            event.ignore() 

if __name__ == '__main__':
    app = QApplication(sys.argv)
    inst = qtApp()
    sys.exit(app.exec_())