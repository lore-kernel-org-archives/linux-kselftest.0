Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401435427F8
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 17:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060247; cv=none; b=lV3PHc47qBgG/Y6UZOAYTzcJYhwDEfz2cEaGrnsRO5DMolMfyYpufj5H9Gb3X5CTqOnEfCMwOyZBPQyBWfUOSMwnHju/5o5IRj1JuyZuszhCwcgY2t80C24KIixfAxkEdOK63oHJuhFH9ZQ168CkOGI12VJA7mKw0uIDROJHTvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060247; c=relaxed/simple;
	bh=AwlQr01gOaB0513mqpwbFOstgch6p4TPUaapjmXe+RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h56lZvAZ2eyrblGiLMJL0b7z40ZOIdge/p66wp/B4Isl15xkFEkSo/ZiXkH/t23NUGjKfBU/6QKd02lfvOr14BHRA0sse8bzlb9ZUkn2f8dPTWUGj18xZYLTfZDut508osX39hqZmOf4eNxSaZNaPzOsUnskDwu2BBnBDf2u6vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCZlT8j0; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCZlT8j0"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f64ea07036so6770059a34.0
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 10:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789060233; x=1789665033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SKblG7QGgHAKfTpoP5V52jptdTaAh+yb1fvW/oZI/IE=;
        b=OCZlT8j0W2JHYXYuFrVsfFyBxVmmuswYK2evkd+cQVjm4wogqIAXwfkXYm3TDRigyU
         LrWNq+tV3Iq/Mk4R0UZZTxQIm0HW3z4H2EvIyMbz3dp9AtxADgl/oBAdclNEq4cKKmi1
         INzVHWPGQDzygJc+grrGVlDqrCyNTfoZamId2UOaDTVXUZvCoxvIrT76q4kGNsbUbMKz
         xsVR84gssQUocZLpWf1/QED5StTp7baWw3NlrmL0Vcr0opFYtqj3rGthmsixO4HGQsP9
         5ULnT2jrYy0EiPIms6jJC+DK6RCezYFZe7CfOY0uoxfiw5n4osqL31IMjeO0UAVD+5/j
         Zi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789060233; x=1789665033;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKblG7QGgHAKfTpoP5V52jptdTaAh+yb1fvW/oZI/IE=;
        b=CIbIz0eWyC6d/JJ0yQuHZcT2TjwOyFx34YGabxVliVz7UlDXmFOaaPKimTJXUo4glN
         qXuDPRbvWfNNAUr+7h4h65IDgX9FRSuTyrtoQ+x4AQQjM4nhomWMAykres7L/RVW1ldb
         Hl0qzW7TC/LkVG6EWwSbmRJO4pAXhau4oLyR/vnA/6rtLSsLFE31+JaV3SeM6xKJph79
         By1LGxBgAkzlLzrUY6wp1b2CgPfGtfAZ7dBX6irDTnAs87GiXsuRkVv0GWnhbydxh4Qf
         ppZ9mOfwQOr5FsJB0QEwrzpJhsk0lBXGjne+gqiB4pjUxRw2bOpzfO7kZ5PqFb52KFAS
         Nhgg==
X-Forwarded-Encrypted: i=1; AKwUvBw13uHG3mLQRleGHAk+EjktEJ5HAiC9/p6W4BdtprEuBw4zq3Hjgr6h9alFR1++qPx5ipoJM6VyX427og6+lXI=@vger.kernel.org
X-Gm-Message-State: AFuF++lZtsTZbtCqdNySVJ7enPD1iPt90h0rBk+HWsvJEOHnibAXJkjE
	/b6VoJegy8+0TUus7Qs/aCP468/aoBwIv1jgtq09YjyHhBhkJhitGIbo
X-Gm-Gg: AYBFou08204uM9ynkgyZmJTrdkJ8UtrbM6SOhYw4PA2GQ732Qx3/Ese4o5Bn+s/vWbK
	eJp6Gx+XMEQDmAmQHJDSUk71O6W7R8Xossk7seJZp9NLaxxlF7ABf8T64Pr65/so/HociakPeYB
	GIBkFBIufE1McSF05X12t6KUo8ZAeo4Anikhe4PcNecYubkbxxS5PQrxeidtIPmJec4UgWEA7od
	OijrGwepSxERdvop75iPrdXHiUHK7CTMjREeBlQ+TPTZUgfZUiZ/TyMZoftBg69IacBh6QLEj7e
	1DMPhUU/sUEb0M/2Smn2VBG1ZqaJTNqgJ9zR8ot3LPIluza1AIMekOq1nzPgykUCwk7ypPg2XYq
	deUolvkhYR5OVJvyIlQi7t1sNiZwbxFZX9i9K+dNRnjk5NrSPk/RmppZZB63fG3XIKTV4GovM9f
	tL6ZXgAqq8tCprkv30OQWeEFAyNUub/PT4VpxolarbWSWaCCCmIUwB9XajpXxXcG3kgvlexplXF
	Z/mC3RQDocf+9guk8XBJqHPkdF8Bw==
X-Received: by 2002:a05:6830:258d:b0:7f6:6618:e506 with SMTP id 46e09a7af769-7fa207af645mr26042050a34.14.1789060233518;
        Thu, 10 Sep 2026 10:10:33 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:8::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fcc45d7852sm14860896a34.20.2026.09.10.10.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 10:10:32 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:10:29 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	matttbe@kernel.org, Stanislav Fomichev <sdf@fomichev.me>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] tools: ynl: Fix out-of-tree build for ynltool
Message-ID: <aqLkhcMb8uSKhQZl@devvm29614.prn0.facebook.com>
References: <20260909071155.1234922-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909071155.1234922-1-maxime.chevallier@bootlin.com>

On Wed, Sep 09, 2026 at 09:11:54AM +0200, Maxime Chevallier (Netdev Foundation) wrote:
> After the blamed commit, running a out-of-tree build for ynltool fails :
> 
>   # make -C tools/net/ynl/ynltool O=/tmp/o1
>   make: Entering directory 'tools/net/ynl/ynltool'
>   make: *** No rule to make target '/tmp/o1/json_writer.o', needed by '/tmp/o1/ynltool'.  Stop.
> 
> ynltool's Makefile correctly accounts for $(OUTPUT) to get the list of
> object files to generate :
> 
> OBJS := $(patsubst %.c,$(OUTPUT)%.o,$(SRCS))
> 
> but it never actually set $(OUTPUT) before the blamed commit, meaning
> that out-of-tree buils of ynltool were always actually in-tree.
> 
> Now, the O= parameter is correctly accounted for, and the %o: %c rule fails.
> 
> Let's update the %o: %c rule to also use $(OUTPUT).
> 
> Reported-by: Bobby Eshleman <bobbyeshleman@gmail.com>
> Closes: https://lore.kernel.org/all/aqCyWQxqKDuQnZYR@devvm29614.prn0.facebook.com/
> Fixes: 917f713b4ec4 ("tools: ynl: Allow cross-compiling ynl and associated tools")
> Signed-off-by: Maxime Chevallier (Netdev Foundation) <maxime.chevallier@bootlin.com>
> ---
> Targetting net-next, as the blamed commit lives there.
> 
>  tools/net/ynl/ynltool/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/net/ynl/ynltool/Makefile b/tools/net/ynl/ynltool/Makefile
> index b8c67cdb4fdf..1053e7606c86 100644
> --- a/tools/net/ynl/ynltool/Makefile
> +++ b/tools/net/ynl/ynltool/Makefile
> @@ -31,7 +31,7 @@ $(YNLTOOL): ../libynl.a $(OBJS)
>  	$(Q)echo -e "\tLINK $@"
>  	$(Q)$(CC) $(CFLAGS) -o $@ $(OBJS) ../libynl.a -lm
>  
> -%.o: %.c ../libynl.a
> +$(OUTPUT)%.o: %.c ../libynl.a
>  	$(Q)echo -e "\tCC $@"
>  	$(Q)$(COMPILE.c) -MMD -c -o $@ $<
>  
> -- 
> 2.55.0
> 

Reviewed-by: Bobby Eshleman <bobbyeshleman@meta.com>
