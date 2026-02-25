Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458CA256C6C
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 02:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771985446; cv=pass; b=EfX1DLBisPThN4kHrSMnky5ABAdc7KVbtd9ON3bmL3Yu7eISVNcscgoAchOXXeW7gNuaw+aBqk337ROawgEhIQsu0WQPM+tNvsCUVD8mujYd8D9eZZC8NMaci2tSWdq5UYgE+9mzTpfWSxBOiiJxBgMS7pqYkFIsqW3j+hRvUu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771985446; c=relaxed/simple;
	bh=2Ia4JQRYF0+vu5ltlafPtPyaUjJd82F6ErOYljpmSaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qqlYT9fqgBAkgGJA7ImbFKEGPGwsJgAprEEWwYXIQCWT+7bXRGdySh5JloiNg+dVsA7WDD8KxQAlpsdtfETMdq/CG2EALzYzFNX7E4AxJqk0V4iMLSspKknCePI5BkQHGsPmjyMzle9WeW6u+xUvV2KUmcaA93bQuKorbcdq33o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sg9duFII; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sg9duFII"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79495b1aaa7so56749907b3.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 18:10:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771985444; cv=none;
        d=google.com; s=arc-20240605;
        b=kc5pu3jOEm8Y087bGqfvL6MEhVwcJhL3C6GqY4oF5hDh2XggSJUxC6OVBXnpCBPG9z
         QHRR+iFQYRdp08BsoaKFJl3ytGXwLy2zoUq9o0gkPGW+Kw3E69/HOUKqJa6CYnxcEzee
         6gBG6zLXJNDpSTWb3giY457rU86B1Y4AvJNOUNeDQUUFyoxdo2gVxN+Eh209++5/+hpy
         1niABqLr093J6nZFZ/36tVWC1yr0dHLhhvMTVuoPSOpckogjW2MyloSHaosNA1NhaxZ1
         Wki7JlvsAtgo7oFUKGMMjLKzAtXTNNHpNoUBry9leCuKy0yk5J1+p6ddVcyHXq1QLH+G
         NC6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RewW6RsQuKBcy+FVC2qZgDOi7JEc3XkGCwTSJ1lCkm8=;
        fh=0RLqHBMUoI4xg8xpaT9zKJhzSQdP7dxsYr3/Gb4xwUw=;
        b=SssRNaGuBWEG75Lk9sPr4TraRk1mAE8g4Ko8UCC1NmrEp/n8qZWVB8C6mOatE3zqf6
         pWIyqqYlosGIKeVWUNQkPC2CFmPNvyE7TnWj+V1IT+8yz2K4jvvScGzgTIBI9KMBMUO6
         83B58k+nXXPjCbbsTVa2GFgfFvYlLuF+xWkkyk9dmN+KnJ/l2squaWftpeGjJtbTKazk
         0Tfoua97wumpR1XdBEY/hQrX1g0/H54SmMk6vg+k4ms4oijKoemQTei6OlCEdZ5pbKRu
         XY88fkZcanF/z22ID2YD4S71h4Wsr1wNkQ6xxylMt6skagzfHFjaOEdIkGgJ/9O6Ai63
         fe0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771985444; x=1772590244; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RewW6RsQuKBcy+FVC2qZgDOi7JEc3XkGCwTSJ1lCkm8=;
        b=Sg9duFIIBzNagLlrMQ/BKm0QzaAlTtKU1nuhkjG19YHOYFhDSvh5jKrZIc6JJPZNj1
         kGlq2pr00+a3Top2Vp86O1ehWkxCuoHLdcOye4Rb1I6Jtb/OIAZIeXsavqLZp7XtQhfW
         lkpTb5LRqZc4NZ8xTCm1VfA4W7Z2wolTpGR5QiljmJ1c4ho2nQUWg0FhpNz7Tn5uBeVu
         nsZJmYOVZO3CUeynXG14ZPIf+7OBuUDg87D+i8mRlEIypuhLH6ab6g6B+hWwil+plSkC
         av0CtBdpG+Y35pkIr/mK7eiZAGPnATZYGUtvHgAQp/Zy8iPb4gvRunKk92erjR2Vgi0E
         kuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771985444; x=1772590244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RewW6RsQuKBcy+FVC2qZgDOi7JEc3XkGCwTSJ1lCkm8=;
        b=FUU3zAmRLQ1qBv4PR+LG4llx0+hiaQ2178MiyTEMDkuesFjqfOzipYyHnErR2tWKYJ
         dgNdSOBOM8tpe2WJZsR8OdI/1MLvWZ8tT/6QW2GGZP8laHHGdvgLchhc6DgzQC26/5iL
         uDsPUqcR23GJjM9K86p09v7+l1KaHFZYJdzUXm1MAOb/fQvz7hxjApOegOtCV+ZO8+Yp
         Y5Y4Zuq8UneK49KFEhy5BaCh3gj2XVUDGb//Xv6MmWcjFGzsgGu2x7ciHg0H/J1Nwerl
         Hey12BJKaEFdcK+W0UI1ESfqarJiZmIwQ9PU6Q3hsDnbhstyg48123RnWx2akqZCcja5
         svVg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ6zDvNqmreAlSa4pGEDcxrwWNwI/dUveG/5uTPDIonMpikIVfz9UVV/4Mtq6JoA5JdZGKhni6ZJWmbr9tuMU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo0sBHdTo058Ps7dcBNYf3jIv+GUMIX8I0PgpjQN3yRj8JUa5L
	MXeiNtRdo7QU4QEeuPWAh446Wvo6SsZPTbKwdGhDvxyPCAiQkA+/mvF0GiBn4oY0KEyus8ejee/
	YGEyX8R4MreJRESU9CNJu4YarcZdL45M=
X-Gm-Gg: ATEYQzy9gbTjzeb0F+rVBP0fQCLi3xoAM6fGo1H4BhL7VTCxulMwrFDposMLBfVV8iz
	THdU/mhazLkhbmB/H3PT4g2VO+qGcolOyQriHgmgFY4BHKhSRcCc9ARBiKTtSa+Lplk2sXzkmkh
	Lr9qtaej9XqXB5l8NuGxUMTRyRfdwptuiNUFQ2Vp2CTTBeKi1ItGT/z5WujnRvd5VWLIiuSfFF/
	s6UGxCyfYRPq0WLm+HJAoVPzdgDquhsPI52NsbPmyk0yuAnrDzT06DzNu4NMKoJNKrlGqxILjtJ
	dBrBBrm1sMTn7gEARli4V0ryKQ==
X-Received: by 2002:a05:690c:a92:b0:797:df7c:3e1b with SMTP id
 00721157ae682-79828ef29afmr127790467b3.4.1771985444319; Tue, 24 Feb 2026
 18:10:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260222111847.692325-1-sun.jian.kdev@gmail.com>
 <20260224113900.3331-1-sun.jian.kdev@gmail.com> <20260224154447.61be24de@kernel.org>
In-Reply-To: <20260224154447.61be24de@kernel.org>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Wed, 25 Feb 2026 10:10:32 +0800
X-Gm-Features: AaiRm50L-4FmoPTjMiSIpbVZQBpkITknQo3RkybcQdVthWClKqiATz6dSZ5LrwA
Message-ID: <CABFUUZFK6jr7Bf9W009vo1LhAnAgvrB1RhmGtYw4viku0+L+nQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] selftests/harness: order TEST_F and XFAIL_ADD constructors
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pabeni@redhat.com, edumazet@google.com, 
	davem@davemloft.net, horms@kernel.org, shuah@kernel.org, kees@kernel.org, 
	luto@amacapital.net, wad@chromium.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 24, 2026 at 07:38:59PM +0800, Sun Jian wrote:
> You inserted these defines between the kdoc for TEST_SIGNAL() and its
> definition.

Ack. I'll move the KSELFTEST_PRIO_* defines out of the TEST_SIGNAL() KDoc
block so the comment stays adjacent to the macro it documents.

> When you respin, two notes:
>  - please wait 24h after the previous version before sending a new one,
>    to allow people in all timezones to comment and avoid splintering
>    the discussion
>  - please start a new thread for each submission, and refer to the
>    previous one with a link in the changelog:

Ack as well. I'll wait at least 24h before respinning, and I'll send v3
as a new thread with lore links to v1/v2 in the changelog.

Thanks,
Sun Jian
