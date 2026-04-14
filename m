Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB42238E5DC
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 08:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154090; cv=none; b=qlRO/36+1Mh6gC94Tr5Vkr/sIm5sBRLCDN1WnRa8XBBl2il4DjmHyOdjRwqyF7jxu63QTFeslLBlLynmfjqAloJ/X+ZGcRs7cN759Yc4VR8omdMzMpoSkDdD6FCRlHSt1VEySBx4jt+U/wTiSH+qkIcJeqiUMKlhhxXAAHjJztA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154090; c=relaxed/simple;
	bh=NCU7HC1t3iEDC4IqX2izve0FBoiDBcxRNyhBdT9YCoc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=sK7/tvRRY0GyIsVjatPO1GAvf7xWZdnZfYe+A3jVYQUvAJfzd2G2VbHsbvgAgQK9PS2EVFh6m+gzSKf17Lc9mhTKVYXSkbjC4L0SKzm1H0Tf1FuB8SvGRNCQspBihylr/yEGSrN/Yy62HgPgvHF89aS/bK9/S040pg+zXBQInIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7dbe11b1f03so1354216a34.0
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 01:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776154088; x=1776758888;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NCU7HC1t3iEDC4IqX2izve0FBoiDBcxRNyhBdT9YCoc=;
        b=V0GvmAvahyeRpwLkmWJMoJXQs0QG/oLQqBebIGcoIZ/snw5acDu/cMdyVuxLuPvreI
         KY8ztOfY9+85aHFD+c86R5tDYs6S3PIowSrvEFqiF2C55yPCQchqpgcdhl6aqf6+mGiB
         ntQy99ZFU5zTqWFcK+uPFVKB4oe614G6rTtaLJPy/WA+tVG0D8MTk/5cXkSZ1D7UPRwn
         Gl/Gs0u5yiMFojLXUGYctEhnIUl3ogQzqXQgvLgv7hOeCJUQe7rj3FQXp/I5kA8R6dSP
         tpZC/WjmdthfGMvdOnFeE0bS4jmI6wovJkfmBUqkvh8thvvAtc2otiy63Pg4RcmLCPOt
         o/BQ==
X-Forwarded-Encrypted: i=1; AFNElJ98r/d7CT72jWfE7MvOP4jJ5ZIz9A06KwqU46nJhZh5EzW9o//rXRGBP1ykBMjBTswVwKT8hcs44gvo5Pu/Aq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwgH1RTZ5ZCDt1v0F2bmklLZbE3YvmLWCh6WuBNrtjOx9D0Ysl
	JBIG1VCpk7U4oL49vHwyAJeZmMibhZCPLxn62Uei0x543HReSF2MXaDKJm8RM62dz1n5E/4Md6Y
	6fZ6zfHy0K9yxik2x/821cyweH/cYtDdDLfgAV/qEvMTCLjiGnOnIuMOk35k=
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:8183:b0:67e:1c67:ebd8 with SMTP id
 006d021491bc7-68be7ee1b88mr7508599eaf.40.1776154087806; Tue, 14 Apr 2026
 01:08:07 -0700 (PDT)
Date: Tue, 14 Apr 2026 01:08:07 -0700
In-Reply-To: <41689f2e-8786-49a6-912d-f65e48245a61@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69ddf5e7.a00a0220.468cb.005b.GAE@google.com>
Subject: Re: Re: [syzbot ci] Re: veth: add Byte Queue Limits (BQL) support
From: syzbot ci <syzbot@syzkaller.appspotmail.com>
To: hawk@kernel.org
Cc: andrew@lunn.ch, ast@kernel.org, bpf@vger.kernel.org, corbet@lwn.net, 
	daniel@iogearbox.net, davem@davemloft.net, edumazet@google.com, 
	frederic@kernel.org, hawk@kernel.org, horms@kernel.org, 
	j.koeppeler@tu-berlin.de, john.fastabend@gmail.com, 
	kernel-team@cloudflare.com, kuba@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, sdf@fomichev.me, shuah@kernel.org, 
	syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"


Please attach the patch to act upon.

