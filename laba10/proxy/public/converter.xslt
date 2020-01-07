<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
        <body>
            <xsl:choose>
                <xsl:when test="/integers">
                    <p>Результат:</p>
                    <table>
                        <tr>
                            <th>Индекс числа</th>
                            <th>Числа Армстронга</th>
                        </tr>
                        <xsl:for-each select="integers/integer">
                            <xsl:variable name="counter" select="position()"/>
                            <tr>
                                <td><xsl:value-of select="$counter"/></td>
                                <td><xsl:value-of select="current()"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:when>
                <xsl:otherwise>
                    <p>В заданном промежутке чисел Армстронга не найдено</p>
                </xsl:otherwise>
            </xsl:choose>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>