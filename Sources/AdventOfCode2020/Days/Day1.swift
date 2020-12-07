//
//  Day1.swift
//
//
//  Created by Marz Rover on 12/6/20.
//

import Foundation
import Rainbow

struct Day1: Day {
    func resultString(input inputIn: String?) -> String {
        let input = inputIn ?? self.input

        let parts: [(String) -> Int?] = [self.findNumberPart1, self.findNumberPart2]

        var output: String? = nil

        for (index, part) in parts.enumerated() {
            let value: Int? = part(input)
            let result: String
            if value == nil {
                result = "no number combinations could be found".lightRed
            } else {
                result = String(value!).lightGreen
            }

            let display = "\tPart \(index): \(result)"

            if output == nil {
                output = display
            } else {
                output!.append("\n\(display)")
            }
        }

        return output!
    }

    func findNumberPart1(input: String) -> Int? {
        var numbers: [Int] = []
    
        var result: Int? = nil

        input.enumerateLines { line, stop in
            let trimmed = line.trimmingCharacters(in: .whitespaces)
            guard let number = Int(trimmed) else {
                return
            }

            for elem in numbers {
                if elem + number == 2020 {
                    result = elem * number
                    stop = true
                }
            }

            if number < 2020 {
                numbers.append(number)
            }
        }

        return result
    }

    func findNumberPart2(input: String) -> Int? {
        var numbers: [Int] = []
    
        var result: Int? = nil

        input.enumerateLines { line, stop in
            let trimmed = line.trimmingCharacters(in: .whitespaces)
            guard let number = Int(trimmed) else {
                return
            }

            for x in numbers {
                for y in numbers {
                    if x + y + number == 2020 {
                        result = x * y * number
                        stop = true
                    }
                }
            }

            if number < 2020 {
                numbers.append(number)
            }
        }

        return result
    }


    let input = """
        1632
        1438
        1811
        1943
        1883
        1698
        1976
        1972
        1794
        1726
        1850
        1789
        1524
        1701
        1454
        1594
        1655
        1018
        1828
        1867
        1959
        1541
        1596
        1998
        1916
        1894
        1727
        1812
        1800
        1897
        1534
        1712
        1825
        1629
        1827
        81
        1855
        1621
        1694
        1663
        1793
        1685
        1616
        1899
        1688
        1652
        1719
        1589
        1649
        1742
        1905
        922
        1695
        1747
        1989
        1968
        1678
        1709
        1938
        1920
        1429
        1556
        2005
        1728
        1484
        1746
        1702
        1456
        1917
        1670
        1433
        1538
        1806
        1667
        1505
        963
        1478
        2003
        1955
        1689
        1490
        1523
        1615
        1784
        1624
        583
        1465
        1443
        1489
        1873
        1485
        1773
        1704
        352
        505
        1705
        1844
        1599
        1778
        1846
        1533
        1535
        1965
        1987
        828
        1755
        1823
        1639
        1981
        1763
        1758
        1819
        1569
        1580
        358
        1786
        1964
        1604
        1805
        1822
        1941
        1993
        1939
        1975
        1966
        1852
        1310
        1687
        1718
        641
        1715
        1995
        1603
        1444
        1641
        1961
        1536
        1771
        1267
        1749
        1944
        1519
        1445
        1818
        1558
        1922
        1452
        1901
        1915
        1957
        1840
        1785
        1946
        1683
        1918
        1847
        1690
        1716
        1627
        1571
        1985
        1455
        435
        1856
        1527
        1660
        1555
        1557
        1591
        1906
        1646
        1656
        1620
        1618
        1598
        1606
        1808
        1509
        1551
        1723
        1835
        1610
        1820
        1942
        1767
        1549
        1607
        1781
        1612
        1864
        2007
        1908
        1650
        1449
        1886
        1878
        1895
        1869
        1469
        1507
    """
}
