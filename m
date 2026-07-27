Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87271409114
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 12:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157196; cv=none; b=YOHXmBsq3vipEw5A9cDfXQ2a+S21yFjoqaLzC5QGWI+fIuXP9YuH8BuSk5pdm1U+L5wc0ogquL++D+VMfUarLJtcEHAE7liWH6j4wjr/8x+PrbT/bHLCr2yXC34c5BuVO8Gn4ZdXb+5rS99hMOCzZBbad5z4PdyAxg3HY9YPP+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157196; c=relaxed/simple;
	bh=WbXVFO9o13n+Kh3XJVydjJbkPJn+hUcXxNF6aQtVdmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCDmOhG8doPp3/o4gEVPrmx6bNK6zUPH/z43zNOf3+GtsXVFRu3oKjPScIiTGqET9KCuIXzHz7AddvpzhvGbgcQWeov+tmZQ1H09GaWU70eNEVQmx4Hk2svn2o3V/eFrQbsp7aUaPzYvXiMVLEOTVfHSJMb6dbBHfSyNHp0pzso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ja3QLJa4; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ja3QLJa4"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so2005301a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 05:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785157195; x=1785761995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WbXVFO9o13n+Kh3XJVydjJbkPJn+hUcXxNF6aQtVdmQ=;
        b=Ja3QLJa4hdpwHiqVGsk+Xi2OW3INO6ZWvQUnJRfp/1nQXK0lSFqWj2CwcVEICS0spU
         sCVKtM5Yge0Yxd8jV/S8yjxu6204l2hwodk0TLQmpC7adQFraPI3kYJnx0AGANgA/IBy
         F7YZvXeg3GgMZjvTMN/c3drF1YU6amOe8ZZ1rRChTC9X9odEhJelOCadj+X0jAj6w0o8
         7sIyiZqjs56b2jBmryjD6/b5INrTa2B8zVo4xoSMW9kFiLXcVHnVsgpkppRkNY26U6jh
         EjP0DXTL5CDDvFJMLUtMbPuRTRq1CYIMTWZWkJR5XQfJsdnNF7w0yuCYzn1dbC6Er/wQ
         c/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785157195; x=1785761995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WbXVFO9o13n+Kh3XJVydjJbkPJn+hUcXxNF6aQtVdmQ=;
        b=hd2saZL0W7oJu29nmYnspdg4nGWinzIyTVfrZgJShQO0RbIA9B8AFKdDTpjW9d8fOa
         z6at2Jz2x8uM9XHB+EWFH8WOo/AQVkyke/xjS2L//MYljEqjBZsxuoHFzCpq5ws0N4b1
         AwcKRjEaTnwItImrGNc2WpG6ap8XZ9o5WoLHcYKz9Rd1k4+j4RzRuKxXQ4s0UJ23kNqz
         GxVK5FbA36uDcX3TSCfxlsGLBFaeCQ7u2LKwipyVn+lnB+jU48+bXDhswZqQkc5+pFGH
         CrFznrALbKRyUbTiUl3ttK99qGwxe6DoSYErvo77ROzcFSdTZRcDlFaAJSeHDlOPA0zj
         xaug==
X-Forwarded-Encrypted: i=1; AHgh+Rq/fC3jSdz4isHXPNSki8huE6WG+WMtiz34u77qntbd5QhcYd+xYdhSuI0ok9xXNCizxI4ZKo7VCGS7FhWyT2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTjTc62FaQkeAke8IupSOSdBOxMDWoRA8nAiEdmm8qTaY42FTW
	dzU/alDmwh+AsjExxjfD/3yuz8vfJgUrP/2kRtW+NJmuCalOoauFg+CQa1ekEjoV
X-Gm-Gg: AR+sD12MmB9l3eVoeFvhAcWv0IGqUyEZjIy53nO29Cx8DL//80AXDex8Y5Y8gU2ZRaY
	afLtQWWIH2P+I4uBYaWvncRoDyNRpVR78EGbUveqVDTpJKLUo8whryzHZZqktJQQ1Q9/DsCQRnY
	uPzb/ZRMuXybXLd6spuOSHYT6Xmhnl11BmL9rA1Q3cH9Uiqa1bQ9gIEgqbb3c4r1wUr5V0xpSxd
	zcQcilFzvF1bPiYGjMFCWafNQres+YkhtogYhQgZU8iIC4RwOhbIz7O/PCUiLyf429YdMjxAwS+
	6q5Rf+NUwaOVdwLkrac6bLSQkskDvNfvdHTotP6ZrS1LV5Z9sLBIlxI0ItHyzEIrosh3iOp3sXX
	k1Qx4hgxEwsmkAxycUOMKoFx5DAupzhkFJAeLWgDvtSAT3wHzbh0n2UtyAQawbkk+mIL1DWlxOc
	tc9LtDmwvUJwFu0fVFEbLJ2Z8Bc5ff5QS1K808AmKY2x06Lg4=
X-Received: by 2002:a17:90b:398c:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-38f293cd1fcmr7935519a91.6.1785157194906;
        Mon, 27 Jul 2026 05:59:54 -0700 (PDT)
Received: from anna.. ([114.70.9.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03adb224sm5147172a91.2.2026.07.27.05.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:59:54 -0700 (PDT)
From: chanyoung <ppoo1220@gmail.com>
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	chanyoung <ppoo1220@gmail.com>
Subject: Re: [PATCH net 2/2] selftests: tls: add a test for splicing onto a full plaintext record
Date: Mon, 27 Jul 2026 21:59:47 +0900
Message-ID: <20260727125947.2889407-1-ppoo1220@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <amdHFJlOVpACBir6@krikkit>
References: <amdHFJlOVpACBir6@krikkit>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

2026-07-27, 13:55:00 +0200, Sabrina Dubroca wrote:
> Why 4 extra splices? One should be enough to hit tls_sw_sendmsg_splice
> with the skmsg already full?

You're right, one is enough - I checked, same oops.

> Do we really need a fresh pipe for each iteration?

No, one reused pipe works.

All four fixed in v2. The reworked test still reproduces on an unpatched
kernel.

Thanks,
chanyoung
