Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F9A334C1B
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Mar 2026 02:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774663936; cv=none; b=F7G/MY2QkHBrsGEjimEBh/jy2N7H7Afqb6q7VvdoFD15PO2ah5/WJu+3MX7JewhJTLITLmBzRePo9y6sBgnn6IKww0wZAvHl+fHB4PcbqXBpo6kh6enhQmcFmNZgFgfay3ZALmrKo2NbxP8M3vGZpDXu6uojoouWttde4YlDFeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774663936; c=relaxed/simple;
	bh=R0hOUyUw1S43YOqTcBVweQ4HGlJUUJRlRmz8ISCMmVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWK4qJtbzD0P6z2HUCxgDrsY1zPCPQbqQVMth4QGCmZHxkBDGftKwIMXGw+EExUk9oZCiQkfOdxhShiSPxoinN/QZ/N6/dX4WQ4eGhneMf0c/tM0ViPf8nUQgZiTSjEqEdCRRDPhtMTAp40vKHHJWm2gch5K+UBQJc7G0oTNuv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TYGaado/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZZlVgckk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TYGaado/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZZlVgckk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774663934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K5pAJhZCqE5oESJaENRwjHgVA6xECCslqT3Zf/bfI5M=;
	b=TYGaado/F6Z6DqpNbYKoqQid/rF2JqNIW8GdUa5WVXXr6i1tQCiZC4jilagvyMEulnjF1k
	3jF3MVq/qAD0Ctt6mUn7IL0u7qSqITL3grRd/4o9qV6M39Q0HJ35lyivz5VtZTkK3/sSK7
	ttt7Nb4/55CQUzfWo01fjUQ2v1y06nA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-1v4evlBHNa2QdJSH9TgLxQ-1; Fri, 27 Mar 2026 22:12:12 -0400
X-MC-Unique: 1v4evlBHNa2QdJSH9TgLxQ-1
X-Mimecast-MFC-AGG-ID: 1v4evlBHNa2QdJSH9TgLxQ_1774663932
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35ba4bf54beso846782a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 19:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774663931; x=1775268731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K5pAJhZCqE5oESJaENRwjHgVA6xECCslqT3Zf/bfI5M=;
        b=ZZlVgckko9dzux7Z89by5maNgTYPVaSZkn2smtnMg7v5gBOJaxUU6OnE5FFeoAPRS4
         OmdHIvCliWNk9sCjYyeo652O2EJwVoc62jD1UDhR7eIXpYj+0fLYNcjScEjxHZDwNHjk
         O/ifjZH5cmuJZhKs2yDN9NXIh4MLyCcCwlsT3+hC0eXFJzYbU9m0BF6LuzktWB1Rb2kR
         8gbasNg3J2V8mu1vM5h/fsOknNOvyUGdSXyCIMrPw5JS3rSTWm2XCAwtzk+Se0kBi6yn
         wDLiTbm47rYmiK+Clk9NoKRgthUv5O5yTu5y/tYQ9L9gvK43uptq61ZI5QhfMdnL5ENq
         gqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774663931; x=1775268731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5pAJhZCqE5oESJaENRwjHgVA6xECCslqT3Zf/bfI5M=;
        b=GWUMo4D0uYKd/7Ydmdy3c91NoHKdmCmYDWgiWioUquZVrs4JQyWlNvat1ljNassNZY
         RNFJyeK0oQTz9jhd3Y26buuuJnNrCdAT7W9m+bkiXg/xrMaChuJZDBuZ/Am2x2fWSlqI
         W6FjdmDM+S0iqzYVkT1LIPFFAdbPr54uzz/r97py8bPGb4jhnLjdFxQVljDqMl8PSJr2
         6xzCUsTPlCIIfO90T0Uro5xEK5o2o5zWom425ySIkc405firU0/V4FAo1q9R6omf8KU5
         ySu6AUzAEXrBUcK6pAx2o18pD5prOpPCJs1Y2K3x2jQVnTBbIvwCq2BxrEfkJHPirnEA
         yx6g==
X-Forwarded-Encrypted: i=1; AJvYcCUL8xuiMOxR0af1jIzYxYc2ITlSkcddNd4d86pFUcsT80aaONv75QVkW1A2Npy/Wg5KIz7Oa4nZ6GEBJ9nLlmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YypwHRuSO3dOiZh4P5E0nwxU+2Va/iHaZHCohx8ExtpcOkB5PWK
	KzdaHKjgxVZ4uVy1zXx1MtKJz+NAERylvGWFyeqtakNYVdly4VFWC1NK7SHRpi+M2yaypUzllNR
	cIHbKjPVH5spJXm2YSLdrLRLHo7x7FeVHi8frOWNgPP91TkSeAzjzr+HXffN31IElCT/SDcX1RO
	p9KQ==
X-Gm-Gg: ATEYQzyPxzDpvfZaCef07j/mU5JCw7BeUbslvyE5aHUfAn512a4igCtJVZDwuOUU/gd
	xyaIlXSgX//ogHtQBeLOBmBi0dCNq0fEwVfCeCFqlR4w05YbYjkqQTSNVfXRtAKT++JUqYD8tLF
	55pAfdFrm7nlViU3Hjb8kgeetEDoGXZj1wTuBSAaPDMwpTKFlQwgXsAr4dYtjxmiAE9wgDC/0je
	JkJJHnIYVc9o2wxXv15Nh/psUQWIndp+iytgUg9d86jBKACAEzWvDMwsgJ2Xht/2F2nPwkLjEwm
	lWW4C6micdRKO82mhtmjBUzGpE7IAgumWDIm1ap74p8W6dWMK0G6xyVkZMtv2tayc5O9P99F+IN
	wIvL5iR0LGBH29GlkRQ==
X-Received: by 2002:a17:90b:2f87:b0:35c:d98:d685 with SMTP id 98e67ed59e1d1-35c2fd94735mr4735950a91.0.1774663931091;
        Fri, 27 Mar 2026 19:12:11 -0700 (PDT)
X-Received: by 2002:a17:90b:2f87:b0:35c:d98:d685 with SMTP id 98e67ed59e1d1-35c2fd94735mr4735923a91.0.1774663930573;
        Fri, 27 Mar 2026 19:12:10 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2eaf1dbfsm1622400a91.3.2026.03.27.19.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 19:12:09 -0700 (PDT)
Date: Sat, 28 Mar 2026 10:12:06 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: tools/testing/selftests
Message-ID: <acc49s7jbI9Q3a4f@redhat.com>
References: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>

On Fri, Mar 27, 2026 at 02:32:34PM -0700, Andrew Morton wrote:
> 
> whinges, perrmanits, maybe I'm doing it wrong, etc.
> 
> a)
> 
> At the top-level, neither `make mrproper' nor `make clean' remove the
> executables from tools/testing/selftests/mm/.  Seems wrong?
> 
> b)
> 
> Shouldn't I be able to run
> 
> 	make selftests
> 
> from the top level?

Should use:

    make kselftest
    make kselftest-clean

> 
> c)
> 
> tools/testing/selftests/mm
> make clean
> make
> 
> does:
> 
>   CC       droppable
>   CC       guard-regions
>   CC       merge
>   CC       rmap
>   CC       soft-dirty
> gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..  -isystem /usr/src/25/tools/testing/selftests/../../../usr/include -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE= -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests  -m32 -mxsave  protection_keys.c vm_util.c thp_settings.c pkey_util.c -lrt -lpthread -lm -lrt -ldl -lm -o /usr/src/25/tools/testing/selftests/mm/protection_keys_32
> gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..  -isystem /usr/src/25/tools/testing/selftests/../../../usr/include -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE= -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests  -m32 -mxsave  pkey_sighandler_tests.c vm_util.c thp_settings.c pkey_util.c -lrt -lpthread -lm -lrt -ldl -lm -o /usr/src/25/tools/testing/selftests/mm/pkey_sighandler_tests_32
> 
> why did it start emitting the gcc command lines?

Those two binaries (*_32 / *_64) are built by custom rules in mm/Makefile.
(Makefile: line #218, #226).

Other tests use shared rules from ../lib.mk, which are quieter (they hide
full commands and show short CC ... lines).

Maybe we need:

--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -215,7 +215,8 @@ ifeq ($(CAN_BUILD_I386),1)
 $(BINARIES_32): CFLAGS += -m32 -mxsave
 $(BINARIES_32): LDLIBS += -lrt -ldl -lm
 $(BINARIES_32): $(OUTPUT)/%_32: %.c
-       $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
+       $(call msg,CC,,$@)
+       $(Q)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
 $(foreach t,$(VMTARGETS),$(eval $(call gen-target-rule-32,$(t))))
 endif

@@ -223,7 +224,8 @@ ifeq ($(CAN_BUILD_X86_64),1)
 $(BINARIES_64): CFLAGS += -m64 -mxsave
 $(BINARIES_64): LDLIBS += -lrt -ldl
 $(BINARIES_64): $(OUTPUT)/%_64: %.c
-       $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
+       $(call msg,CC,,$@)
+       $(Q)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
 $(foreach t,$(VMTARGETS),$(eval $(call gen-target-rule-64,$(t))))
 endif

> d) within tools/testing/selftests/mm:
> 
> 	make clean
> 	make -j100
> 
>    compiles 3-4 things then ends.
> 
>    A subsequent `make -j1' compiles nothing.

Sorry, I wan't able to reproduce it.
Did you mean -j100 only build few source file but not the whole?

>    Whereas
> 
> 	make clean
> 	make -j1
> 
>    compiles everything.  Slowly.

Both -j100 and -j1 works well from my test (vm: rhel-9.7, x86_64, gcc-11.5.0)

-- 
Regards,
Li Wang

