From: jmattson at google.com (Jim Mattson)
Date: Fri, 27 Jul 2018 10:18:47 -0700
Subject: [PATCH v16 01/10] x86/msr: Rename MISC_FEATURE_ENABLES to
 MISC_FEATURES_ENABLES
In-Reply-To: <20170320081628.18952-2-khuey@kylehuey.com>
References: <20170320081628.18952-1-khuey@kylehuey.com>
 <20170320081628.18952-2-khuey@kylehuey.com>
Message-ID: <CALMp9eR-g7-vv8vcTZbf0jeoH=5wNfnwjOT-gW-4gPFDsrLBJg@mail.gmail.com>

On Mon, Mar 20, 2017 at 1:16 AM, Kyle Huey <me at kylehuey.com> wrote:
> This matches the only public Intel documentation of this MSR, in the
> "Virtualization Technology FlexMigration Application Note"
> (preserved at https://bugzilla.kernel.org/attachment.cgi?id=243991)
>
> Signed-off-by: Kyle Huey <khuey at kylehuey.com>

The old spelling matched volume 4 of the SDM, Table 2-43. "Selected
MSRs Supported by Intel Xeon Phi Processors with
DisplayFamily_DisplayModel Signatures 06_57H and 06_85H."
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
