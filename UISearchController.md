```text
1. 검색컨트롤러 인스턴스 생성
resultSearchController = UISearchController(searchResultsController: nil)
2. 검색 결과는 동일한 table view controller에 결과를 보여준다
resultSearchController.searchResultsUpdater = self
3. 검색컨트롤러는 검색하는 동안 네비게이션바에 가려지지않도록한다
resultSearchController.hidesNavigationBarDuringPresentation = false
4. 검색하는 동안 배경이 검은색으로 변경되지 않도록 한다
resultSearchController.dimsBackgroundDuringPresentation = false
5. 검색컨트롤러 스타일 설정
resultSearchController.searchBar.searchBarStyle = UISearchBarStyle.prominent
6. 검색컨트롤러의 사이즈를 화면에 맞도록 설정
resultSearchController.searchBar.sizeToFit()
7. 검색 컨트롤러는 테이블의 Header에 위치시킨다
self.tableView.tableHeaderView = resultSearchController.searchBar
8. presentation context 설정
self.definesPresentationContext = true
```



