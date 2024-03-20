const globalCssVar = {
    // layout-left
    layoutLeftWidth: '210px',
    // layoutLeftFooter
    layoutLeftFooterHeight: '40px',
    // layout-header
    layoutHeaderHeight: '60px',
    layoutHeaderBgColor: '#fff',
    // layout-footer
    layoutFooterHeight: '40px',
    // app-logo
    appLogoHeight: '40px',
    appLogoImgWidth: '32px',
    appLogoImgHeight: '32px',
    // db-table-menu
    dbTableMenuWidth: '210px',
    dbTableMenuHeight: `600px`,
    dbTableMenuColor: '#ffffff',
    dbTableMenuBgColor: '#3f4361',
    // db-table-menu-title
    dbTableMenuTitleHeight: '40px',
}

export function useCssVar() {
    return {
        ...globalCssVar,
        dbTableMenuHeight: `calc(100vh - ${globalCssVar.layoutLeftFooterHeight} - ${globalCssVar.appLogoHeight})`,
    }
}
