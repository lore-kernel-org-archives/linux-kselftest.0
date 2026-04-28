Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16353E557D;
	Tue, 28 Apr 2026 10:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777371319; cv=none; b=uVBMuu2l9IOAVKSwtlOgFJ8dXBUKmEZsKk1JpHLbYmHfBlfY3H58hqJypFpA9sjDZ6FfXWHnIYoBAzNPTirW/NTpU0jtkco9zfL3F/iI/m2hyw0GwlcgNjh+rXsJnfQPbMarpRWZBu4bQ5FzeKMaENHEssHNTeqeDw5KIcCyvPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777371319; c=relaxed/simple;
	bh=ofVz5HqdphQZ+WDXJPcnWX4aaxd9tyeydKj7LMa8neo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3+bSeVq2RJ4IzF9axIq1IxdtteCZPRofOOZH6sWcrM5u1kOPd3ySs1qkLBrB/qvA8uYoVpcIF10VxcJnxWSrLDWdpZU5uQDqrRCKBacqBbZshUrNZWUu7GPK75ucu+D6qHJ9ycWi7r5wqQ5otXqr1iZXQLo7RLfXy0QJCiJavw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MW6wK6sI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MW6wK6sI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81DE21650;
	Tue, 28 Apr 2026 03:15:10 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81AC23F763;
	Tue, 28 Apr 2026 03:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777371316; bh=ofVz5HqdphQZ+WDXJPcnWX4aaxd9tyeydKj7LMa8neo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MW6wK6sIVeDlOJOa9WK9oww+c9ipPg8oKl+MTzOK+fJXwVRQTMDVQmbUIjr5R9IgA
	 8bMwCHgpOKZWAvaiTJrg1nrHUQn9EJHLnDsGuz/ZdsxhVvW+/lil360K+9/bYH1BHb
	 zI5gylqOvy72EuXy1nrC6BvtE3BGJdBLrrNEnK/A=
Date: Tue, 28 Apr 2026 11:15:13 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kselftest/arm64: Fix build failure with GCC-15
Message-ID: <20260428101513.GE16537@e132581.arm.com>
References: <20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com>
 <aeuRfEeOUWEHzPix@arm.com>
 <63409143-f4eb-48c3-89de-1aef4fb57381@sirena.org.uk>
 <aeud4Hqxq4PNitMc@arm.com>
 <b94bce09-69d5-4454-b4a0-81612f286f0a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b94bce09-69d5-4454-b4a0-81612f286f0a@sirena.org.uk>

On Fri, Apr 24, 2026 at 06:09:01PM +0100, Mark Brown wrote:
> On Fri, Apr 24, 2026 at 05:44:16PM +0100, Catalin Marinas wrote:
> 
> > OK, so it does look like it picks the kernel uapi/asm/ptrace.h. It
> > builds fine on Debian stable (no GCS anywhere) with including
> > asm/ptrace.h and removing struct user_gcs.

kselftest has the GCC option: "-isystem $(top_srcdir)/usr/include",
So asm/ptrace.h does come from kernel's usr/include/asm/ptrace.h.

NT_ARM_GCS comes from /usr/aarch64-linux-gnu/include/elf.h.

> > But I think we should include asm/ptrace.h in libc-gcs.h and not the
> > gcs-util.h header (for NT_ARM_GCS it's fine to keep in gcs-util.h).
> 
> It's not glibc specific so it seems reasonable to keep it in gcs-util.h,
> even though we don't currently have any nolibc stuff that uses ptrace.
> That said this isn't particularly strongly held opinion so I don't
> *really* mind either way.

Does below change make sense to you?

Subject: [PATCH] kselftest/arm64: Include <asm/ptrace.h> for user_gcs definition

kselftest includes kernel uAPI headers with option:

  -isystem $(top_srcdir)/usr/include

Include <asm/ptrace.h> in libc-gcs.c for the definition of struct
user_gcs from the uAPI headers, and remove the redundant
definition in gcs-util.h.

Fixes: a505a52b4e29 ("kselftest/arm64: Add a GCS test program built with the system libc")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/testing/selftests/arm64/gcs/gcs-util.h | 6 ------
 tools/testing/selftests/arm64/gcs/libc-gcs.c | 1 +
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/tools/testing/selftests/arm64/gcs/gcs-util.h b/tools/testing/selftests/arm64/gcs/gcs-util.h
index c99a6b39ac14..7a81bb07ed4b 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-util.h
+++ b/tools/testing/selftests/arm64/gcs/gcs-util.h
@@ -18,12 +18,6 @@
 
 #ifndef NT_ARM_GCS
 #define NT_ARM_GCS 0x410
-
-struct user_gcs {
-	__u64 features_enabled;
-	__u64 features_locked;
-	__u64 gcspr_el0;
-};
 #endif
 
 /* Shadow Stack/Guarded Control Stack interface */
diff --git a/tools/testing/selftests/arm64/gcs/libc-gcs.c b/tools/testing/selftests/arm64/gcs/libc-gcs.c
index 17b2fabfec38..72e82bfbecc9 100644
--- a/tools/testing/selftests/arm64/gcs/libc-gcs.c
+++ b/tools/testing/selftests/arm64/gcs/libc-gcs.c
@@ -16,6 +16,7 @@
 
 #include <asm/hwcap.h>
 #include <asm/mman.h>
+#include <asm/ptrace.h>
 
 #include <linux/compiler.h>
 
-- 
2.34.1

