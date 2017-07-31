include chocolatey

class windows::excel_viewer {

        package { 'excel.viewer':
        ensure   => 'absent',
        provider => 'chocolatey',

        }
}

