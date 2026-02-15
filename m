Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F6817736
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Feb 2026 01:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771120297; cv=none; b=Hpne8AUmVYvT4kBU6MiyEI2oWf2fzz7z4F6ThJ5z2Nv+S/K8tv8KNCrSKcZT94JJCod4aOyOu8qRRZrRgs8Lv3aWr98frSL/QJgr1MbDtRm8vlc6Q7BMQAfgPr0GTzFHx38zekgAN0DTJ1UtzvXFcRf96s4J6fMpeaNjfNkMJxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771120297; c=relaxed/simple;
	bh=aynqYx/4vXrVtJrG7uZcJ7qt+wuroA58UNg1OJqu4hw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xs2cCXXkCN223sXhrtd0Lh2k+ppzBk/GZHO01EVcsvbmKOXqmE5o+j3SuElQt4KoeBDCpaE5NgUQ77ZTktqRdS+nLi47G6x3FwZe2TO4UYJBLwk4oZspfODxzlUjBGwjPz4Qz6PinJAsGQlzc8z6u36Fz3zO2+Bbk5uVN37Lyl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VibTDzfh; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VibTDzfh"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a7a23f5915so11799075ad.2
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 17:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771120296; x=1771725096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aynqYx/4vXrVtJrG7uZcJ7qt+wuroA58UNg1OJqu4hw=;
        b=VibTDzfhQWQxOqxAROVMOMR/rxnvxk1QvremwR/8LyNSSXhjBKYk/rV7uUhKxVit27
         rPzOmzFi6ZQbKxAGh2H71sE8ohFocAZBMwL9PDRaQCB/+CMAPrHzzqaGMTDcDBrjti+Y
         cdeX/aX4bmcMplYL6kCi1J60mp02IG+Hlrctlgsz04doV5f1oIWI03kRmxNy+nMQC1OW
         qiXhuHPjUGMm7Fz/KWERD/1R+2GHP1dI4Bboz1bb4Vy7+JsHjwMZgd4/mZS2L3U2bGD7
         MKrC9Ez4MpPLv/5UqydOQzmgeaJw4JUxs0B0ndLDy+HoNB/+3IkReazluaOGXCEwlaL+
         /ZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771120296; x=1771725096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aynqYx/4vXrVtJrG7uZcJ7qt+wuroA58UNg1OJqu4hw=;
        b=o6DK4b8ZoJcGfLAwrgP+TNTQHjTIdrUBunIQ3bv/e11zq1U6j8564WDWXE6YnBaNs3
         WW11WxLIa3Cfua1+yfAwfyht2Bzaz7WDuYDSDo5A5AoRo19XqEwy+1wPTRhdNeDcw+ss
         udooCO1uyd7dV8qjrUfblu7nL2NBdSQx2boQ09vYmc4a3+Haa9/WoJ6CSOavYNyjqVI4
         vTY4WWl3421La9CuSfniO47utaN+GxsExaY/hA9A+zad1KH4mr9E0Q2iUhZW9qcYvYEr
         hYf5JzqvKiMI9KSAiLdSw6Npw9VYZec2eOP/DhQFI16saxwo81/yVsoEXnOK4xHjTwLC
         Pn7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7LoNNGz9RD9wpfz0JyvNEKl87ehowL+Jc88Azy++HFC/pI9IzNWk4eno2ooOjnWiQybhQU1AXykL6Eq2Eo6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXF18jPZOogMO9HnPflpUoG6OYgmnNBmb5Wblhxu5ce7WvN3fL
	ROyUhJOZT3927wPo/3FvbxMr6Ert0lx9W+VbqbdGGYaX/yw3GQRUuDLH
X-Gm-Gg: AZuq6aJFFP/gYNDmrMW7IzieIa56X2nwgB5V6awOgLWjzZ5aIvDOYIDhL7Pl3n7I6Hk
	2ywVNGMi/OFYRtVIDUmYiD3GNeQDamBueMB6BDLzx3AelQ0LKqlZyWDMmqO3CMwSlfZT9us+SK9
	gCl7QM2X0UPS/MyY4W7gku//Vi62Yb04+f7pYf8E5UlLLh8vlkPD1eyfBzx3jFVu2Ybdor/lXxk
	cPX43d88xSR1UNsxqUNPlq0fANGlLqia8qkQQdSxTUo21gqj7cJaCY46eYGlQLUSRcT4x8e/C1M
	EAqywImJfAkm8vE6BbiO0qFmUO/pn+AxZpW90Xhn0BWm2n+9Sb0vesksFhxc+kjME8llK1xQl8J
	x2EGbdQ+nTYKCQLFCxNMZcKq8hoONf7T67TioBaZ4ORzZKYMnQs6E/yy87w7uHbIDrdfuqiVxto
	nM81YLDo3pd83bQGpNnWdzZNQi8CWB7iAN5TIECPbqg9sTNOUS5uoOws7H6jDarBI9swW1i+sbr
	ilkWm3QCInp6CE9sT8=
X-Received: by 2002:a17:903:3d0e:b0:2aa:fc73:98ac with SMTP id d9443c01a7336-2ab5060a12cmr67069865ad.49.1771120295840;
        Sat, 14 Feb 2026 17:51:35 -0800 (PST)
Received: from localhost.localdomain ([49.207.200.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6fa229sm29761405ad.18.2026.02.14.17.51.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Feb 2026 17:51:35 -0800 (PST)
From: Anand Kumar Shaw <anandkrshawheritage@gmail.com>
To: alexei.starovoitov@gmail.com,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bpf: expose original requested max_entries in bpf_map_info
Date: Sun, 15 Feb 2026 07:21:29 +0530
Message-Id: <20260215015129.75566-1-anandkrshawheritage@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260214115431.55574-1-anandkrshawheritage@gmail.com>
References: <20260214115431.55574-1-anandkrshawheritage@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Feb 15, 2026 Alexei Starovoitov <alexei.starovoitov@gmail.com> wrote:
> Clearly a user space issue.
> The kernel side never promised to keep max_entries constant.

Thank you for the review, Alexei.

I agree that callers who create maps can track their own values.
However, BPF maps can be pinned to bpffs and opened by a different
process that didn't create them. In that case, the consumer has no
way to distinguish a kernel-adjusted max_entries from the original
request. The kernel is the only entity that knows the adjustment
happened.

That said, I understand this may not be a strong enough use case
to justify a permanent UAPI addition. Happy to drop the patch if
that's the consensus.

Thanks,
Anand
