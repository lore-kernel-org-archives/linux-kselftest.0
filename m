From: keescook at chromium.org (Kees Cook)
Date: Sat, 11 May 2019 07:51:32 -0700
Subject: next-20190510 kselftest results
In-Reply-To: <359070592.29.1557569697898.JavaMail.jenkins@db10df53eddc>
References: <359070592.29.1557569697898.JavaMail.jenkins@db10df53eddc>
Message-ID: <201905110746.D6C85E86F6@keescook>

On Sat, May 11, 2019 at 10:14:57AM +0000, ci_notify at linaro.org wrote:
> Summary
> ------------------------------------------------------------------------
> kernel: 5.1.0
> git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> git branch: master
> git commit: a802303934b3bd4df6e2fc8bf2e4ebced1c37556
> git describe: next-20190510
> Test details: https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20190510
> 
> Regressions (compared to build next-20190509)
> ------------------------------------------------------------------------
> No regressions                                                                                                          
>                                                                                                                        
> Fixes (compared to build next-20190509)                                                                   
> ------------------------------------------------------------------------                                               
> No fixes
> 
> In total:
> ------------------------------------------------------------------------
> Ran 12 total tests in the following environments and test suites.
> pass 11
> fail 1
> xfail 0
> skip 0
> 
> Environments
> --------------
> - dragonboard-410c - arm64
> - hi6220-hikey - arm64
> - i386
> - juno-r2 - arm64
> - qemu_arm
> - qemu_arm64
> - qemu_i386
> - qemu_x86_64
> - x15 - arm
> - x86_64
> 
> Test Suites
> -----------
> * boot-lkft-kselftests-master-519

What counts as a "pass" for this? I looked at the x86_64 log, and there are lots of kselftest failures, but the dashboard counts it as a "pass"?

$ wget https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20190510/testrun/716064/log
$ grep '^ok ' log | wc -l
60
$ grep '^not ok' log | grep -iv '# SKIP' | wc -l
30
$ grep -i '^not ok.*# SKIP' log | wc -l
18

60 pass, 30 fail, 18 skip

-- 
Kees Cook
