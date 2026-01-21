Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7F041C2EA
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 21:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769029500; cv=pass; b=R6DnnPa84M2sRPJ1tOwkMlSZxA/aVWxPM+yNSwtS5ZQRnKUyHTl7KNb+OYJKpKKHCQVU1By7SLj5aT2xKcrjMsoFkmPXyceIkihGRkoeNVr8T40pApPQ9IaRkXeE6Qc0TDs1Mq1VAzpfUJM8LqPZ5dGu8hWydjktku2TQCZS/Ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769029500; c=relaxed/simple;
	bh=gSLjnwENfDdpz+9PItfkrLqKgChq1TKHNQUCVDDelMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q7jDarOHHszp1iHNACo/BXtVGJlHJYOmusZ2hwMWCZCs/WXUVLCveCpKk4owt5bageP0qVEKTy5iI0MerrZ+G/klfNQM6kfPwpoarC3H4ttWFuabna+AiMPaUoqgJlOX+RCwBMl/VQkPVvj3xOhRlGV7tw1h5oh8sdeyg1lUzM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IgNWO/WI; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgNWO/WI"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so30927666b.2
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 13:04:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769029497; cv=none;
        d=google.com; s=arc-20240605;
        b=FrkjGW91qEB40sG8Pc+LOYgYkOFlwnbk0VoIE6bSA37kVGEtQyUuOqklMz/n6d4ebg
         uPx+PUiEr+bNwaYs9cUo2kRESiwGhBffMC18VHC+/wtUzwJo0SQ+/6klbiGDg7HQzCBL
         rJ54ozJvIiWmJ/OhMAx3iXvDWzseir8HxsaTkt9+9T1kdXjAHXYY2xhjtRaH1e0zoeoE
         jmp5VTCrabtJEMz7aynv9C1SPC1sv9LJ/M9Jnajqru1aeEb1wfoVww6JR691cx20a7/Q
         hLg3EsfBVgiURmc8qT/2ci2Pbw17Dor/vLb7VobuS77HkhLiZfbYLXJ7xZUdsnSAdVWn
         bKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gSLjnwENfDdpz+9PItfkrLqKgChq1TKHNQUCVDDelMw=;
        fh=VIVLJY0HFTNIc0sXkI7TVuaUpYMYyi8/Fdtix9iDZ8s=;
        b=jOu65hnzL3K+M+qnTZOBKDeB6CHXygMuIDizBDxSRSHjoguGz2zzIHDsD3D6ffYo8/
         E/PtiJQoWVIzo+lgvHHGxDqdJ3QFr6yCw59T7X6wWK0ta0yZM/pXaamwP2gqQQ5EodgL
         kgBvG8PodozA9szTyhDfSZfLg6hBSHm4gDqgDCxHzeSjdz+IdtTnerSawmsvmU4I/MpY
         R9AWrg7QG0UL14ZU2B2xt+/nF1UndrCHpuncrCa52OxAdKCdKx9kg9qSqudfWBdK6z0J
         AGicwVqjMkA3tzOjILHpRvkVuHDwNDQ5UxS3s3Z8RoFmMYCn2JN6hVlvz2a2qKoGXilc
         v9aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769029497; x=1769634297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSLjnwENfDdpz+9PItfkrLqKgChq1TKHNQUCVDDelMw=;
        b=IgNWO/WIh+0K6YMV3XA6UvOwqH9PJgpPgrhWD1Zi789pqtFqePxDbCxCu7MoSMBmS5
         T3hd9k75pODcdTQh5whCZyB/whmdTxxrQvWwL4n8opIBBfhAxpGAdDzff5RWu+0wdHFf
         UFJZZLuMR5TqwLOyQzvlGkkde3RwFm+Xq3WhdK/KdWcvlDqjcJA3W2oLzbps8Oh11/IH
         pZJwbTF58xtJqX/LDG73nI85ruMPlp+efKGu39zu4eu+YGIdi/Cvw0Bx9IcS6VaYIzt0
         mX3P8TJWHQqwxgrpoNhpii34QQGZO23QTx0oROFWa4HcPnxBOIsFmqLS+3QmA31z0Lzw
         Nkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769029497; x=1769634297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gSLjnwENfDdpz+9PItfkrLqKgChq1TKHNQUCVDDelMw=;
        b=wVozCGnvhPirNdzRFtEE8LwS1Gomic87FvLFkeAZOmwKZGf3RDoTbg7dMn3B3z6K6j
         EQTUIFeXGZh7RmrEH6xqyPWjRfBBTx96Pq79yf2HYDl4Z2gCUDPdR6YezJg7em20Www4
         GjK99v6OIMumBIS5ZbvwLkBSRoB/DTjmiMmXlLnzJNHEtkUf80tS8m8aOalpd16rXEiZ
         Yl/RLNRArA6JAi4bEdp6shRsMOtRngg6WW3HlS9/cpFDGPzf3Xh0QY0EhsWC1vy6pXSw
         Yqz0IcnuEuIiRk4QuztZvrD5AHaNBeaNvP1xyeL6/q1V45CC/5iDWmTTNAG4/F9AzM0k
         DvEg==
X-Forwarded-Encrypted: i=1; AJvYcCWvHurgt1NBKNe0gpXPq29BQxb2PoYpScZ66DMfIJUngU4n5RRL5eGHXBZdvjSsr3wRgbuEHjUM4M+opJiMNhs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3+4cO+KBoj9B7Wi7rNJLkkFfYMzl3Wi9wqNPjwuWrvMLmt+w7
	hgkNHoMpvEihtDSRy5IchZL+WvBYYZN1KV89ItuE0S+Qv+eQIi01uTqJvKDaG5WatdluP9KKfHS
	VebphZ08eAZWkAvhbVidOJD0M6u7y8ko=
X-Gm-Gg: AZuq6aJe0HczkFp+ARYcbRwYbWpfgZ+9Sl/+snWMYLKaJjomRm9EVeA68LOsdrTo3Qw
	t85ENIWaSavBRYBQv0o2w89nHK+6dgkpdQ0ELtn4fB8qWjb6+N7QfyxmYo/+fAWTJ1CO1nIrjjl
	lDrdItefJFT4FdAzEfYl4pTEUdOD3UqbE1S4buwIiK2X2AG8yr2tn87r6KPel/+UNEC2qW+SQTs
	bMxl4bUkh1ZjS8Bjz1lXpjEDjBF3OpGlQMjJ6Yk8Qo0cOtPpuriLO5fIrrwH9GT93b9
X-Received: by 2002:a17:907:3e8c:b0:b87:2579:b6cf with SMTP id
 a640c23a62f3a-b8800348798mr542186566b.41.1769029496665; Wed, 21 Jan 2026
 13:04:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251214163537.1054292-1-geomatsi@gmail.com> <20251214163537.1054292-4-geomatsi@gmail.com>
In-Reply-To: <20251214163537.1054292-4-geomatsi@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 21 Jan 2026 15:04:44 -0600
X-Gm-Features: AZwV_QidXXkyj2bjrzSiHllVK1M96P6KIDzPQnqs0PpSlQkqnW3H1x2SSHe7zuc
Message-ID: <CAFTtA3MMgY5Nz_ZvQNfVijjTpk4w76B3keQjCLzftuFG05PDfg@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] riscv: csr: define vtype register elements
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Joel Granados <joel.granados@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

On Sun, Dec 14, 2025 at 10:35=E2=80=AFAM Sergey Matyukevich <geomatsi@gmail=
.com> wrote:
>
> Define masks and shifts for vtype CSR according to the vector specs:
> - v0.7.1 used in early T-Head cores, known as xtheadvector in the kernel
> - v1.0
>
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Reviewed-by: Andy Chiu <andybnac@gmail.com>

Thanks for putting v0.7 together,
Andy
