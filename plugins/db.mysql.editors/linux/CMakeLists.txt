set(MODULE_DATA_FILES
    res/editor_mysql_table.glade
    res/editor_mysql_table_live.glade
    res/editor_view.glade
    res/editor_user.glade
    res/editor_role.glade
    res/editor_relationship.glade
    res/editor_routine.glade
    res/editor_rg.glade
    res/editor_schema.glade
    res/live_editor_decoration.glade
)

install(FILES ${MODULE_DATA_FILES} DESTINATION ${WB_PACKAGE_SHARED_DIR}/modules/data)

include_directories(.
    ${PROJECT_SOURCE_DIR}/generated
    ${PROJECT_SOURCE_DIR}/backend/wbpublic
    ${PROJECT_SOURCE_DIR}/backend/wbprivate
    ${PROJECT_SOURCE_DIR}/library/grt/src 
    ${PROJECT_SOURCE_DIR}/library/base
    ${PROJECT_SOURCE_DIR}/library/forms
    ${PROJECT_SOURCE_DIR}/modules/interfaces
    ${PROJECT_SOURCE_DIR}/library/grt/src/diff
    ${PROJECT_SOURCE_DIR}/library/sql-parser/include
    ${PROJECT_SOURCE_DIR}/library/sql-parser/source
    ${PROJECT_SOURCE_DIR}/library/mysql.parser
    ${PROJECT_SOURCE_DIR}/plugins
    ${PROJECT_SOURCE_DIR}/modules
    ${PROJECT_SOURCE_DIR}/frontend/linux
    ${PROJECT_SOURCE_DIR}/frontend/linux/workbench
    ${PROJECT_SOURCE_DIR}/frontend/linux/linux_utilities
    ${PROJECT_SOURCE_DIR}/frontend/linux/sqlide
    ${PROJECT_SOURCE_DIR}/ext/scintilla/include
    ${PROJECT_SOURCE_DIR}/ext/antlr-runtime/include
    ${PROJECT_SOURCE_DIR}/ext/antlr-runtime
    ${VSQLITE_INCLUDE_DIRS}
    ${PROJECT_SOURCE_DIR}
    ${GTK2_INCLUDE_DIRS}
    ${CAIRO_INCLUDE_DIRS}
    ${SIGC++_INCLUDE_DIRS}
    ${GRT_INCLUDE_DIRS}
)

add_library(db.mysql.editors.wbp MODULE
    ../backend/mysql_relationship_editor.cpp
    ../backend/mysql_routine_editor.cpp
    ../backend/mysql_routinegroup_editor.cpp
    ../backend/mysql_schema_editor.cpp
    ../backend/mysql_table_editor.cpp
    ../backend/mysql_view_editor.cpp
    ../backend/register_plugin.cpp
    mysql_table_editor_fe.cpp
    mysql_table_editor_column_page.cpp
    mysql_view_editor_fe.cpp
    mysql_user_editor_fe.cpp
    mysql_role_editor_fe.cpp
    mysql_relationship_editor_fe.cpp
    mysql_routine_editor_fe.cpp
    mysql_routinegroup_editor_fe.cpp
    mysql_table_editor_index_page.cpp
    mysql_table_editor_fk_page.cpp
    mysql_table_editor_trigger_page.cpp
    mysql_table_editor_part_page.cpp
    mysql_table_editor_opt_page.cpp
    mysql_editor_priv_page.cpp
    schema_editor_fe.cpp
)

add_dependencies(db.mysql.editors.wbp mysqlparser)

target_link_libraries(db.mysql.editors.wbp linux_utilities wbscintilla wbpublic ${GRT_LIBRARIES} ${GTK2_LIBRARIES} ${SIGC++_LIBRARIES})

set_target_properties(db.mysql.editors.wbp
                      PROPERTIES PREFIX    ""
                                 VERSION   ${WB_VERSION}
                                 SOVERSION ${WB_VERSION})

install(TARGETS db.mysql.editors.wbp DESTINATION ${WB_PACKAGE_PLUGINS_DIR})
