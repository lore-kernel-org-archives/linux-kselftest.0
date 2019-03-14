From: zohar at linux.ibm.com (Mimi Zohar)
Date: Thu, 14 Mar 2019 14:38:37 -0400
Subject: [PATCH v3 5/7] selftests/ima: kexec_file_load syscall test
In-Reply-To: <20190313101436.GB25643@dell5510>
References: <1552304473-3966-1-git-send-email-zohar@linux.ibm.com>
 <1552304473-3966-6-git-send-email-zohar@linux.ibm.com>
 <20190312121001.GA18510@dhcp-128-65.nay.redhat.com>
 <1552409474.24794.63.camel@linux.ibm.com> <20190313101436.GB25643@dell5510>
Message-ID: <1552588717.8658.5.camel@linux.ibm.com>

On Wed, 2019-03-13 at 11:14 +0100, Petr Vorel wrote:

> > > So if split kexec tests to another folder is not doable please just
> > > ignore the comment.
> 
> > Left in the selftests/ima is a similar test for kernel modules, which
> > uses the "common" functions.  So either we wait to move the kexec
> > tests or allow them to reach into the ima directory and use the
> > ima_common_lib functions.
> I guess just load ima_common_lib.sh for now would be good enough.

After thinking about it some more, I've decided to remove the kernel
module test from this patch set and to simply move everything from the
selftests/ima to selftests/kexec.

The kernel module test will access scripts/kexec/kexec_common_lib.sh
until there is a generic set of functions.

Mimi
