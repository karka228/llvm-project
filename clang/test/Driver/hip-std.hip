// RUN: %clang -### -nogpulib -nogpuinc --target=x86_64-unknown-linux-gnu -offload-arch=gfx906 %s \
// RUN:   2>&1 | FileCheck -check-prefixes=DEFAULT %s
// DEFAULT: "-cc1"{{.*}}"-fcuda-is-device"{{.*}}
// DEFAULT-NOT: "-std="{{.*}}
// DEFAULT: "-cc1"{{.*}}
// DEFAULT-NOT: "-std="{{.*}}

// RUN: %clang -### -nogpulib -nogpuinc --target=x86_64-unknown-linux-gnu -offload-arch=gfx906 %s \
// RUN:   -std=c++17 %s 2>&1 | FileCheck -check-prefixes=SPECIFIED %s
// SPECIFIED: "-cc1"{{.*}}"-fcuda-is-device"{{.*}}"-std=c++17"
// SPECIFIED: "-cc1"{{.*}}"-std=c++17"

// RUN: %clang -### -nogpulib -nogpuinc --target=x86_64-pc-windows-msvc -offload-arch=gfx906 %s \
// RUN:   2>&1 | FileCheck -check-prefixes=MSVC-DEF %s
// MSVC-DEF: "-cc1"{{.*}}"-fcuda-is-device"{{.*}}
// MSVC-DEF-NOT: "-std="{{.*}}
// MSVC-DEF: "-cc1"{{.*}}
// MSVC-DEF-NOT: "-std="{{.*}}

// RUN: %clang -### -nogpulib -nogpuinc --target=x86_64-pc-windows-msvc -offload-arch=gfx906 %s \
// RUN:   -std=c++17 %s 2>&1 | FileCheck -check-prefixes=MSVC-SPEC %s
// MSVC-SPEC: "-cc1"{{.*}}"-fcuda-is-device"{{.*}}"-std=c++17"
// MSVC-SPEC: "-cc1"{{.*}}"-std=c++17"
