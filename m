Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F532D8DD4
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 23:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770075208; cv=none; b=pIhfObESTj+GARZvz8a7/1TMnx+lQCDOva1gIWvLpECtf12Y067aVTcBCtYdxJqAs5A9RYfN4NwlwaQ8IU3zJBJuhc2RheyVPeBVamp5ciZxpIdVVbnjHp76KS+SEYQJsj+Ym6QwYWjuL+gfR8Ri5Dlcv/wjkR9T2bY6E5K4jUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770075208; c=relaxed/simple;
	bh=1PfIjcCUf0n72gkr/qQ6+v00sY0aohTisHhVNRQacLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ia+VjBp3SECWSTZ4PkgIDHJ12vmwVqC/PevkQ9r4dtvFqY7ys8aKPstb9lJBI/VfSVJUcnDvBw/A+DmViA80Ku0hlnjOi/mgaqWLtwpBZvc1+O1yRHC8mPsqv0m6Fht4OshUopq5j+Uz6nns1J2lWOuM+Z+ErR+g4yHLfMlS/og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TKjgT1ZO; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TKjgT1ZO"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-81f4ba336b4so4181238b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 15:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770075206; x=1770680006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ANttx+3xqwhzhSSAtBDnWSGrH0OO63SEOI513k0jcTs=;
        b=TKjgT1ZO5liHq6OiXBYYg5X0PrMd127f0GCrsSKlw+Js8ypQq2d4f6ivRSrc4DWaEQ
         tJ7qgYC57TbIkQyGxa/T1tK54XH825jB2r7RwASZ+btFrcbEd+Gl3yLHM0qxnMvK1Bhp
         dTBDFfF7lwUypiJh7sg3ealU6dLVVc2bpgsgPv/7S72PnG2O9UOJG86ieF3q64N2FjFj
         DAnffbabVFcYI93FwgBNlMrAxhCfBTz/TyoU1+DD34k5xnFMydx/phFJFWe/ab6zxRDj
         lCJmYrDjkcGHxjhi/frTmYWPv9qc9/mI4/u+ZzKTWxLtcbbsE5M+dEHT+xRbCR+Xvbj7
         w2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770075206; x=1770680006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANttx+3xqwhzhSSAtBDnWSGrH0OO63SEOI513k0jcTs=;
        b=UzS73Wz8EThMYFIST5wlZOMOtk2ZOSojorugSnWfW+3ZGlSkHtVgwTYgg6nryo5wM2
         RlVGbx88uhwXZwz+ovVGNaIvhSZ14Ev+dazJ4gAFtBhvBXhjq+f8t6wN+bsp1gZZe9/t
         boEeH5bKKFygXJlvtIuu1cdY1a/4qlP35kY2lE76GbVPm3PcXk6nOIy7MQKpLD7BSwSZ
         qbZ9HIXEdYRMk/kRTxCQP2wQOCfKYLb19qL8/pGWexVZ6y5/VmQAtv7R/OJ3MdFlrli1
         0QJrOTVXIj9n/WHKvgLWb3/2NtdLZTXuIQqRzf5p2CrNqPhMSq2VBPHacbmcQeW1nUt5
         agCw==
X-Forwarded-Encrypted: i=1; AJvYcCUp6uJpjAmcpenWuTdZYWZjUnGEM251WmePsfQNIHIC/x9L4EW6kRv2CW1sxunYGVnUZ812Is3sPVdqlqI79bA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcga9YDqOOk7pBYGxWcxf2dpTDKANe3EYbHudgMH+koUe1FlqR
	qO3Z/ou8cKE5b1sHGZeGL0/gezWx9lpBO97IzKRdYgueADY9mdtHAe0NZGGB87EqhA==
X-Gm-Gg: AZuq6aIgHghiC2tfWXK+9Jqr/Sq0QJ/Gec8YBwVVw2Gbss0gOHrTAWDSjAVoNsxlU+4
	fL+kI39d+2R4QgL7jMopR1n9pCTDpdh1SMUgtwz2c/imVSrYIYgoreRyb8pmE2OUXn8z2dwmsSB
	NN2owQaG5Sgv1MQoRQa3J+6Yn5E/yvM9Xr8Hfdg59ieUQLMY1+FZmy8PTXekSXBdp5o8u/DeZc8
	grWJzigXZZvfXHLAJUgPxaeQKJfi5/dgcKbX4Y4w9xfFinJ2HrjuT2ZIHx7cWpnvO8l8FQjh5ax
	2/+jQAL/ctz7vSHB1y6TDfFlhqmmhvOZUso8UumSNe29TsnKBImsZYjD5qHxrGLRygI6FWrlnkE
	lvW7+4DcLdx7FKoQDDigQ0FWESl1WDTgT1wrErrYzDu+y0ETLSAmNU64WPGYy+ORIGRR/ms9cPB
	7wAhZIYXvkospy7lSK5G40eyDufACk+TIC+t3QPFpITp+iJfUSPw==
X-Received: by 2002:a05:6a00:9089:b0:81f:517a:56e7 with SMTP id d2e1a72fcca58-823ab6963c7mr12552960b3a.30.1770075205957;
        Mon, 02 Feb 2026 15:33:25 -0800 (PST)
Received: from google.com (79.217.168.34.bc.googleusercontent.com. [34.168.217.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b49fecsm16438559b3a.15.2026.02.02.15.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 15:33:25 -0800 (PST)
Date: Mon, 2 Feb 2026 23:33:21 +0000
From: David Matlack <dmatlack@google.com>
To: Ted Logan <tedlogan@fb.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] vfio: selftests: only build tests on arm64 and x86_64
Message-ID: <aYE0QUnXYq6OYvq9@google.com>
References: <20260130-vfio-selftest-only-64bit-v1-1-d89ac0944c01@fb.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130-vfio-selftest-only-64bit-v1-1-d89ac0944c01@fb.com>

On 2026-01-30 04:02 PM, Ted Logan wrote:
> Only build vfio self-tests on arm64 and x86_64; these are the only
> architectures where the vfio self-tests are run. Addresses compiler
> warnings for format and conversions on i386.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601211830.aBEjmEFD-lkp@intel.com/
> Signed-off-by: Ted Logan <tedlogan@fb.com>
> ---
> Do not build vfio self-tests for 32-bit architectures, where they're
> untested and unmaintained. Only build these tests for arm64 and x86_64,
> where they're regularly tested.
> 
> Compiler warning fixed by patch:
> 
>    In file included from tools/testing/selftests/vfio/lib/include/libvfio.h:6:
>    tools/testing/selftests/vfio/lib/include/libvfio/iommu.h:49:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
>       49 |         VFIO_ASSERT_EQ(__iommu_unmap(iommu, region, NULL), 0);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    tools/testing/selftests/vfio/lib/include/libvfio/assert.h:32:37: note: expanded from macro 'VFIO_ASSERT_EQ'
>       32 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
>          |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    tools/testing/selftests/vfio/lib/include/libvfio/assert.h:27:22: note: expanded from macro 'VFIO_ASSERT_OP'
>       26 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
>          |                                              ~~~~
>       27 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
>          |                                           ^~~~~~~~~~
> ---
>  tools/testing/selftests/vfio/Makefile | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
> index ead27892ab65..eeb63ea2b4da 100644
> --- a/tools/testing/selftests/vfio/Makefile
> +++ b/tools/testing/selftests/vfio/Makefile
> @@ -1,3 +1,10 @@
> +ARCH ?= $(shell uname -m 2>/dev/null || echo not)

What's the reason for the stderr redirection and "echo not"?

> +
> +ifeq (,$(filter $(ARCH),arm64 x86_64))
> +nothing:
> +.PHONY: all clean run_tests install
> +.SILENT:

I think you can just add the following line so that this is a valid
empty selftest Makefile on unsupported architectures, without having to
define all those targets:

  include ../lib.mk

Also I would recommend spacing things out a little so that the
unsupported architecture handling is more "off to the side".

e.g.

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index ead27892ab65..9386f75b590d 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -1,3 +1,10 @@
+ARCH ?= $(shell uname -m)
+
+ifeq (,$(filter $(ARCH),arm64 x86_64))
+# Do nothing on unsupported architectures.
+include ../lib.mk
+else
+
 CFLAGS = $(KHDR_INCLUDES)
 TEST_GEN_PROGS += vfio_dma_mapping_test
 TEST_GEN_PROGS += vfio_dma_mapping_mmio_test
@@ -28,3 +35,5 @@ TEST_DEP_FILES = $(patsubst %.o, %.d, $(TEST_GEN_PROGS_O) $(LIBVFIO_O))
 -include $(TEST_DEP_FILES)

 EXTRA_CLEAN += $(TEST_GEN_PROGS_O) $(TEST_DEP_FILES)
+
+endif


> +else
>  CFLAGS = $(KHDR_INCLUDES)
>  TEST_GEN_PROGS += vfio_dma_mapping_test
>  TEST_GEN_PROGS += vfio_dma_mapping_mmio_test
> @@ -28,3 +35,4 @@ TEST_DEP_FILES = $(patsubst %.o, %.d, $(TEST_GEN_PROGS_O) $(LIBVFIO_O))
>  -include $(TEST_DEP_FILES)
>  
>  EXTRA_CLEAN += $(TEST_GEN_PROGS_O) $(TEST_DEP_FILES)
> +endif
> 
> ---
> base-commit: c3cbc276c2a33b04fc78a86cdb2ddce094cb3614
> change-id: 20260130-vfio-selftest-only-64bit-422518bdeba7
> 
> Best regards,
> -- 
> Ted Logan <tedlogan@fb.com>
> 
