From: lkp@intel.com (kbuild test robot)
Date: Sun, 3 Mar 2019 10:04:39 +0800
Subject: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190301160856.129678-1-joel@joelfernandes.org>
References: <20190301160856.129678-1-joel@joelfernandes.org>
Message-ID: <201903031026.gHhuddZ8%fengguang.wu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190303020439.Rwq_u07z5VzAgbccMWRybJQ-mmn8XATnREQ3c9iCOHw@z>

Hi Joel,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.0-rc8]
[cannot apply to next-20190301]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Joel-Fernandes-Google/Provide-in-kernel-headers-for-making-it-easy-to-extend-the-kernel/20190303-014850
config: microblaze-allmodconfig (attached as .config)
compiler: microblaze-linux-gcc (GCC) 8.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=8.2.0 make.cross ARCH=microblaze 

All errors (new ones prefixed by >>):

>> find: 'arch/microblaze/kernel/module.lds': No such file or directory
>> find: 'arch/microblaze/kernel/module.lds': No such file or directory

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 56201 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190303/7572fd61/attachment-0001.bin>
