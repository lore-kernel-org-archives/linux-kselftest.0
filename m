From: zohar@linux.ibm.com (Mimi Zohar)
Date: Tue, 12 Mar 2019 12:51:14 -0400
Subject: [PATCH v3 5/7] selftests/ima: kexec_file_load syscall test
In-Reply-To: <20190312121001.GA18510@dhcp-128-65.nay.redhat.com>
References: <1552304473-3966-1-git-send-email-zohar@linux.ibm.com>
 <1552304473-3966-6-git-send-email-zohar@linux.ibm.com>
 <20190312121001.GA18510@dhcp-128-65.nay.redhat.com>
Message-ID: <1552409474.24794.63.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190312165114.ETgt5hHIHsI6MZyhzymVd9FIRz_YXHXilptryvo3X-8@z>

On Tue, 2019-03-12@20:10 +0800, Dave Young wrote:
> Hi Mimi,
> On 03/11/19@07:41am, Mimi Zohar wrote:
> > The kernel can be configured to verify PE signed kernel images, IMA
> > kernel image signatures, both types of signatures, or none.  This test
> > verifies only properly signed kernel images are loaded into memory,
> > based on the kernel configuration and runtime policies.
> 
> I understand this is for IMA testing only, but I still wonder if this
> can be expanded to common kexec tests, like
> tools/testing/selftests/kexec/kexec_load.sh
> tools/testing/selftests/kexec/kexec_file_load.sh
> 
> Is it possible for ima/test_kexec_load.sh to call the
> ../kexec/kexec_load.sh, probably add extra argument eg "ima"?

These kexec tests are meant to coordinate between the different
methods of verifying the kexec kernel image signatures.  Nothing about
them is IMA specific.  Moving these tests to
tools/testing/selftests/kexec makes sense.

> 
> Frankly I did not read and followup much about the testing code changes,
> not sure if it is doable or not.  The code sharing under testing folder
> seems not very good.  For example the basic check_root is needed by
> different parts, but all have its own implementation.  Anyway this is
> not the duty of this patch set.
> Also the selftests/lib/ is not a folder for sharing code for different
> tests, it looks a standalone test instead.

Shuah suggested upstreaming these tests first and defer introducing a
common set of functions to later.

> So if split kexec tests to another folder is not doable please just
> ignore the comment.

Left in the selftests/ima is a similar test for kernel modules, which
uses the "common" functions.  So either we wait to move the kexec
tests or allow them to reach into the ima directory and use the
ima_common_lib functions.

> 
> BTW, does CONFIG_KEXEC* is checked?  in case a kernel without KEXEC or
> KEXEC_FILE compiled in then the tests can just return directly.

Good point.  Now that there is a common function for reading the
Kconfig, I'll add that check to both the test_kexec_load.sh and
test_kexec_file_load.sh tests respectively.

Mimi
