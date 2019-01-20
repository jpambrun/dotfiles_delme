#! /bin/sh
case "$(file --mime $1)" in
    *application/dicom*             ) dcmdump $1 | ccat --color=always;;
    *ascii*             ) ccat --color=always $1;;
    *             ) ;;
esac
