From: ahmedsoliman at mena.vt.edu (Ahmed Soliman)
Date: Wed, 14 Nov 2018 23:29:59 +0200
Subject: KVM selftests are failing
In-Reply-To: <CANBxJ=G4xdF8ZOR4zyoX1edNa=jYxk1xrzoi+7Xgcqt9qDoM2w@mail.gmail.com>
References: <CANBxJ=EQOt1t=PkLsMvtfB2SbiLMPeGvFxB7SJXf7m3OkcionQ@mail.gmail.com>
 <20181114180807.6crs7awhvo26ldbr@hawk.localdomain>
 <CADYN=9Jh10guVNFfhS8XH+RwZAouLJQu7Svg4+Tz3rQDexzDkg@mail.gmail.com>
 <CANBxJ=G4xdF8ZOR4zyoX1edNa=jYxk1xrzoi+7Xgcqt9qDoM2w@mail.gmail.com>
Message-ID: <CANBxJ=EB8izWM8iLd49Uvd1z1O-gLvkGmiKNHjfHifFohj2xbg@mail.gmail.com>

Hello again,
On Wed, Nov 14, 2018 at 9:23 PM Ahmed Soliman <ahmedsoliman at mena.vt.edu> wrote:
> I don't do a make clean normally, but I will do it this time when
> bisecting, also I only use shallow
>  clones so it will also take some time pulling. Also to note, The arch
> I am using is Haswell, I am not
> sure if that should make any difference though.

I started bisecting from commit 783e9e51266ebb7f78c606a53cb0fa41bb7c31a0
which introduces kvm selftests. I started from complete clean kernel build and
run, but unfortunately, I got the Assert there too.

Just in case it might help identifying the issue, this is the output
of my lscpu:
    Architecture:        x86_64
    CPU op-mode(s):      32-bit, 64-bit
    Byte Order:          Little Endian
    CPU(s):              4
    On-line CPU(s) list: 0-3
    Thread(s) per core:  2
    Core(s) per socket:  2
    Socket(s):           1
    NUMA node(s):        1
    Vendor ID:           GenuineIntel
    CPU family:          6
    Model:               69
    Model name:          Intel(R) Core(TM) i7-4500U CPU @ 1.80GHz
    Stepping:            1
    CPU MHz:             897.938
    CPU max MHz:         3000.0000
    CPU min MHz:         800.0000
    BogoMIPS:            4788.69
    Virtualization:      VT-x
    L1d cache:           32K
    L1i cache:           32K
    L2 cache:            256K
    L3 cache:            4096K
    NUMA node0 CPU(s):   0-3
    Flags:           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
                     cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm
                     pbe syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon
                     pebs bts rep_good nopl xtopology nonstop_tsc cpuid
                     aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2
                     ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 movbe
                     popcnt aes xsave avx f16c rdrand lahf_lm abm cpuid_fault
                     epb invpcid_single pti tpr_shadow vnmi flexpriority ept
                     vpid fsgsbase tsc_adjust bmi1 avx2 s mep bmi2 erms invpcid
                     xsaveopt dtherm ida arat pln pts


> > What would be the difference in CONFIG_* fragments that you both have enabled?
>
> Here is my config file:
> https://pastebin.com/fCNV2z8c

Kind regard,
