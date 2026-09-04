Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2063B95F9
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788517106; cv=pass; b=b5HCJfivw3PsSg97yuCmZE11oIHv0umMPlgaTOW4+LHerJGw+zmwbYxR1lqT4mnve3Jn9O4Kd9/CVY7pwUIwIm9i9re/zlbaBz2hFd+F3dLkbSyz7Qgjy+MZ142Ydmq4HTiG1JkGwxtp7iNUnjwnv+8XavLw8fn3W/oIk6B/ssg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788517106; c=relaxed/simple;
	bh=7ecM1UWhebC/3/+iusmGdcjinHnlJFmUl69Lno0FSOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AfBmAgAwmIGmDDtUtKxnt5PjQWFRRqUfhJpLVSgT5BeOHSei84EztaNuPvVZ9TIfgCDiwXHQhyUythU3YljZvLn2s52jmDR7A/RUctdaKf0uvZn++FkhvjCmpqu8PP/cyYO91aJRq/mp2/eTo3Hb2xIc3lpSb3xGmmxj39oGXI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvuDQPHC; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvuDQPHC"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66825847b2cso1109147d50.3
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 03:18:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788517102; cv=none;
        d=google.com; s=arc-20260327;
        b=dlzayMqkdla/J91G98El/O+d5GcyADX9jtB+ZN/DniBrerBGWvPT1FLlDFLN68heIj
         EGympF9bknCPWDUB7ew01qJ/IjxasfFdCwdu/ndO5KqZirbtOP/c7ZL9tgVpWncA+z4v
         5mXO1xLVqPRvpXGaCvNGGSDckZmKrzXg/0xBcfVBr6rzzhLeS3YTNvHn6M8znpM9Ll1W
         Yf+qdyCWkpglQvyNE0Qufb6DzMbHf49aFQ2cA+73GUu1Dh30gkbuEp0xhtnVpGpJE6SB
         InH0otdKp6Iv96ktXVQ4NaZ3+FtsRWSzXHAZ+/JR3eSBnV+Yl6uD9vzblviKpTPs1tAa
         zgpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7ecM1UWhebC/3/+iusmGdcjinHnlJFmUl69Lno0FSOQ=;
        fh=YbRfnXKRDR0h1nrwRrpBVICeZkBOy9iIqc0UJrA1VEw=;
        b=EIlgO2bzpMTt+d/Ca1vzNJ+7mEeu8pF+8gwFl2AaHagOB84eFAn4u2/p/+FhB7ggU6
         WZPhmULNDoHqFtDrLPi111/+lkqCUJ+7biVw4M8sDFW+z0tcnOV0bsJB8ygjGOIFteDG
         TnTXxg5+Yds4jqQPiNiEeXLLR4PtVXbRyIYa9TutuYbHtmAouhNxAFGxipuzfqVLD+k2
         F3rsMKIDjhMgelC8mcq4+frk1elFkzQeDuI5Ee9UvW8ATh8Umh2GaUuzmpG1GLtxnh2y
         LJkln4LWh4AF+h+t+LmOZ/gZN6VBrHjl4pEoCypdpvTfEbzNi23dCoNtnmMKOdontdsQ
         Z+UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788517102; x=1789121902; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ecM1UWhebC/3/+iusmGdcjinHnlJFmUl69Lno0FSOQ=;
        b=kvuDQPHChtGy+Kras+DtQIaJcoSrp84OfcYDEQHyfthx/6KkS8IPv6XcB4s0K2m1oa
         2KU4yDtXhgoHzdbgJpb7Lhkm4wd5nzbANlF1SvRHRzSg5MTOoZ3mEIZEMNvu9erpmofB
         VoUOtzy5Y+8b9w/iKXQvIaDvni9qXiKWNBtG6ybsHC9leQj/M0BN04NaIPVxc024gcu3
         48ujquQAK5YpBGCXBzeg43NkgB+Jg9oEPWbcuuOABM2En42qHFcQbVTPL5KkaykdYDzH
         6WzExmw/8trIvYdXGpeQmxaD+++QdqrAkQPxjGkPdKu2i5nWBrweHQMSoFTv3jRaTJRn
         ZDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788517102; x=1789121902;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7ecM1UWhebC/3/+iusmGdcjinHnlJFmUl69Lno0FSOQ=;
        b=NIrbPRiV6IFzsZbBpj2M4i02RQerG5WkAULX4s8Kt+b/69epNsoVX6SXP54544pJ0C
         jxVgpfI1eVP4IU8Ycnc6Id75BQXHDUpQH10bIfeNWSFTLgRvYNgEZwh92Fu01Ljn6O8c
         6Sbiqe5cNMrrDLYMtSKLIDjY189nt+jtH7WgwWviFSMoENvNeRr6U4rIm3/vPWllyixZ
         4QWB2fJgETqe2jc8oG81y3cTImlEuSCw2dY4k/q+3iAEZtAzioZu2x0DM45u4FmugdsJ
         0A0yeQVwTIcnkV+/7/qDaPpPOHN37IIzL1v54sEimZXk9bEsx/avUAq3TBaey7AgVzgC
         D02A==
X-Forwarded-Encrypted: i=1; AKwUvBzBi4wtzd+wb+aqUFyfJRqAxRsLy8v9bcru5/A8n2W43bCuJ9bAN8IGyEUGmaeUttZEUIzrKhe6dXCSCwSJOyI=@vger.kernel.org
X-Gm-Message-State: AFuF++kQs3oYLzns9sP3Zzoi3jUpCe1CwCInYBejqi75k7qIL7GeRWe9
	zRKtKc7EtEw/Iwn4cJDF1jVVleLuzfSx86ITCZarP4eiFJrH7b768+E5wPHFfAgZWw8T8OTF9Ii
	NVgtRH5AIxkehgsCotbdiw8Xtmu+fZio=
X-Gm-Gg: AYBFou3icZAhZC5Bd/BkmqRqDWrDCrviKBf7ATlM74+8yuWJeDm9ejHlN6p1bxwmPO9
	UnUaKaK/l3ahtxPcYt0U722thEmZH8bXbPauJwXGPJvvciXanXeGHBPWhoPSmqy0dtYpncwPYGY
	pjswo1OEHhzWDVqn1/IJEgoO43vTwtlXcvCHZU+j6/9W7P46Ta4AxPIFr8gYf4P3x352yyyYvcm
	QcPq9Kgu7StCMfrRG9k5A14rMXcL1VCPxohwfJYQOpEsoFt3Gnqly7OtEe0ys1nuD8mPByskjKj
	qvMpgjDNHjBcVq1dcN1kE3OyFQbG4GfD5VXUj3jVuJ7NyuWHfnEVUd8//hWru71GDP7AbaTF44q
	1
X-Received: by 2002:a53:c053:0:20b0:66f:a1b4:741c with SMTP id
 956f58d0204a3-66fb5958686mr1624093d50.12.1788517102415; Fri, 04 Sep 2026
 03:18:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904082954.48738-1-enelsonmoore@gmail.com> <apqXNCL4X_i6xy2Z@gremlin>
In-Reply-To: <apqXNCL4X_i6xy2Z@gremlin>
From: Tigran Aivazian <aivazian.tigran@gmail.com>
Date: Fri, 4 Sep 2026 11:18:10 +0100
X-Gm-Features: AcwNN1X7ex5eCk4ouskYN2ChvEs-v8zBI8q8LI-VGa7gCcqGKoso7q1xSbR0jLY
Message-ID: <CAK+_RLm9HKkm8YCCanpOMxaMaAkt5eoxQBHBxC1-Xkvj=L=UsQ@mail.gmail.com>
Subject: Re: [PATCH] bfs: remove the filesystem
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jakub Kicinski <kuba@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Hisam Mehboob <hisamshar@gmail.com>, =?UTF-8?Q?Martin_Kepplinger=2DNovakovi=C4=87?= <martink@posteo.de>, 
	Christian Brauner <brauner@kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Eric Biggers <ebiggers@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, David Howells <dhowells@redhat.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "Theodore Ts'o" <tytso@mit.edu>, 
	Catalin Iacob <iacobcatalin@gmail.com>, Stephen Hemminger <stephen@networkplumber.org>, 
	Andrew Lunn <andrew@lunn.ch>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Andrei Vagin <avagin@gmail.com>, 
	Wei Yang <richard.weiyang@gmail.com>, Bhavik Sachdev <b.sachdev1904@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Wang Yan <wangyan01@kylinos.cn>, 
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, Malaya Kumar Rout <malayarout91@gmail.com>, 
	linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Luis de Bethencourt <luisbg@kernel.org>, 
	Salah Triki <salah.triki@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 11:05, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> Based on Jan's feedback at [0] that closes the loop (it is indeed a
> maintenance headache):
>
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> [0]:https://lore.kernel.org/all/35dsgpk5dsh6bm4xoblrq6hdslfvtuibl5grzag37cye2hgepk@rkrtkjxdyk5g/

Ok, I won't cry about it :)

In fact, if I may, I would like to say that it is a pleasure to be in
your (pl.) company once again. Looking at the list of people included
here -- some familiar, some unfamiliar -- I remember the younger days.
I have done my tiny share of contributing to the Linux kernel as best
as I could, but as I now grow older I can no longer maintain BFS
(older does not mean inactive, just active at other things), so if it
does give maintenance headache, by all means -- remove it :)

Acked-by: Tigran Aivazian <aivazian.tigran@gmail.com>

PS. This reminds me of d'Artagnan's phrase from the Soviet version of
"The Three Musketeers" -- "my consolation is that if I am to be
killed, I will be killed by a true musketeer" :)
