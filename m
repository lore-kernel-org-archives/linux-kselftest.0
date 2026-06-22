Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335D1238C1A
	for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 16:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782145237; cv=pass; b=F94ba0bJRY6OhYPc19Ljo4LZa7DbT1s6PjrpQX2qMcsaoKztLx9mWnR1GFtrKU3zpRayxBz70FQkJthpj99jgKKhcNYf60V2ttOPZthLECGtSl5GZ+64KE9tY7ZL0lYwzJgSgAsMuQl80L/wXVWRSKyna1nTv31x+8pSe7WoeKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782145237; c=relaxed/simple;
	bh=d2s41L5jEoLolC/wFtH4H+ngMP+cqu+AY2cetSGdFzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ayQCMO+2+lbhzTNemiGITgjXvl1Ra6JvJQ8UH+NGV5glyS+mQero00nmA1X9NScDlsopvkbd5zFd9SYLuvGazAYYwnGMpoTJyivOpEBEvBfVcTnEftHv0vq82xzsgRtk6PvjYcqorqn8fNp2LOPjbhWB6vfrgCcG0S4fjsSLA8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XlSpV4X2; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XlSpV4X2"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1390f75d8bbso3614064c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 09:20:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782145235; cv=none;
        d=google.com; s=arc-20240605;
        b=J5NyoKSsDKCtoqZv1V9znaX1nMAGYOhztyhHd0/+1IoWTyHAyqjTD1CfLj+elQgAlQ
         mUQSsWBHJ4z+tRLkObvPC1y6P9BQRMIKnPa1qHip06In4k9VfGQ2WObiqDZtkkSFGp9h
         ufKw38e0pKHTUkAW/Wwm1khk6OZVdh8paTCHQryJsc4BCnwKbf/N3vIZrF5E4U95d3BG
         iyiqVHtaxGLw89hHmaVaLmF5te0FimO5EacbbN6Ph5veG0XhvrABT5VlFOiaENNVxoQ1
         LQYtJnTCOAirC8bfhhZ95cb+mJi4tJWyRWad6JsOPBcJyX13HZYxxTSgTRXVwwVFvLQu
         pW0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d2s41L5jEoLolC/wFtH4H+ngMP+cqu+AY2cetSGdFzI=;
        fh=kTxcOGL+FwTuitIx9fHw+rM7yOic2Qn1IP1vZTbY0s8=;
        b=Fa+bVBjW5cZAdXUPtEguHJlzkNfFhfd+LRcMSKfVgIaAGjcYszVU5eJKl86mQz14dk
         LiEOnem45SgEjzprHrt8eCyG0SgVyqsv5ixuchGlFU5b/4GcZ60fVKNU3qUvGf4dnQ0p
         NnrviLci5JKmZmprswMDVFh58RUAwG4H1A/Wds460GWPxUDFoZw9drN6NHuOXaSFsngB
         /P5mIbqahxdmQl276m732ahTjnbNBgo+kmkjTfCHf5NdCDpyZx3PmE+is7gUGuzTmYBt
         I2l922nFrwR8lugA3xK6c3xK3GBPU/SZkpTZJTSi7winlil9YYWoyUHE9kQAlCf+720T
         bRLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782145235; x=1782750035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2s41L5jEoLolC/wFtH4H+ngMP+cqu+AY2cetSGdFzI=;
        b=XlSpV4X25p62keVDC++kdLGPFSN7/o4k5EImXm2y7R7EDMifxlHsjwvgHbP7k3d+vR
         Tfr0j1dHgvgtmyCij18RwJy5wWKmJAwWdf8bH+eFVcmkP4F1XnBDpCVVDVo33sbkK7ot
         e0EiYP617Oe75SDoTqHWLaLgYg/SORLnx/kzv90X8ZUEtOir259CvCn9ByT+S+e9MTmZ
         ONAg4PkSV9TUmP3QfSTWHJ/Cb0X5cDyn+yHSLlc0M3CUkRCWEEaa80GavttgOolfJElq
         mPKpKgbSBrX9oWOwhMcR+0UM+AuO5HiJVN8wjgwtEIhLzjUhcJu1uiCtPxK/OHFNRH78
         0MGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782145235; x=1782750035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d2s41L5jEoLolC/wFtH4H+ngMP+cqu+AY2cetSGdFzI=;
        b=hYMTgs1W3UyrFvCD9WPRpJsunyoJ0LBFeadrmWE1RuC0U/ETsPouBfAL7LmTVfGN1c
         FZ9ekyYpPVaXu83T82lRJUoYsUJG0O/uVSnkc0TJLfDC6G+knyPrhudcluQkNkwa9ezj
         2woFAXsckD34lM7/gFx874b/zDgKTQSU8f8oW36e2+vE4huL3PK4uYi/vGmBKHhTkgwp
         Jx4DEgSg9L0Cm1MP6CzBlHLBGZokZvnWAnL+K5jYT+utBk1SifHTyz8R3kP0WRpdIm/+
         9hKWMalQGuXns4wwTezyoJ95jHKbc5igdQJryRMBVYyLbjOTUOz3uJzvPiY2uhrphXaf
         SgPg==
X-Forwarded-Encrypted: i=1; AFNElJ/n0trE8TbIzA6P95Wxn9ys+gF7X84dwOqQV5er+3yPsqcE6K0GUHVeT4ENqm+gYgB9hej0HsvADaGQM4wJAqI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2qhs12KZj5yl3KOQqdvvM3Dn+CsMe8yW8zoS/SjpYRdDzAE4+
	vhIQ5niyQUCLikyn2OSGDMIl9J6GOv1bmZYdTSQ29HiiNAyubFqKMM9Jwb5e7xlFPOrAJhT3dwX
	9YM0GcayXRuD+C1YnMabJsLO2w2xPNozfN95wr9c9
X-Gm-Gg: AfdE7clPZvOI/ADGycdyLvRIyfIQLTnAtP9y7DET33ZkG28ASgMn4KqI349DNRxm63i
	TLHl/Szg5JovZqkyNEuTqjPCcZOg5lxcl4x3Z4R4HmtoJQwHWpMskoIGZziq9x0JopyJA5wAf/X
	kzlgtRwLPgXR2+zrtHRWt7y8RdhTi6ehR3knXk1iBiQAzWGQ7dCkB13WrZgmnwJIwE+bsC51YHK
	Qnhgb3ewIJeNS/SZTgvLubViHLundtQNk2N3PX1zOkHsFSRcL4S/7dmFDAFGNTIOsZlTsp9eRdH
	iIdAw9A8B4te1a+Qcv8r/WRas6RoWTidLw5JB1HBKBiNPG/3yMM8EuG96AOsYI+4tfwezZl05g+
	8dgENx/WTuiWYuCnfo0KwjvkqyL7lKIAoWSGXEO8=
X-Received: by 2002:a05:7022:f689:b0:12d:b993:c68f with SMTP id
 a92af1059eb24-139a4eb3fe3mr7372238c88.4.1782145234469; Mon, 22 Jun 2026
 09:20:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782067871.git.littlesmilingcloud@gmail.com>
In-Reply-To: <cover.1782067871.git.littlesmilingcloud@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 22 Jun 2026 09:20:22 -0700
X-Gm-Features: AVVi8CefNqoZIwMgiAqTs65Jmu1vMLZc99AH-rRVQEeoV0pk5hWF6Qn8wG3L51o
Message-ID: <CAAVpQUAQR3SNTpCuTvEMnMsOmyJnOyWWoOWS6uARyd==ZfDung@mail.gmail.com>
Subject: Re: [PATCH net-next RESEND v3 0/2] udp: fix FOU/GUE over multicast
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netdev@vger.kernel.org, Willem de Bruijn <willemb@google.com>, davem@davemloft.net, 
	David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 21, 2026 at 12:04=E2=80=AFPM Anton Danilov
<littlesmilingcloud@gmail.com> wrote:
>
> This is a resend of the v3 series originally posted on 2026-05-05,
> which did not receive review feedback during the previous net-next
> window.

Probably due to RFC, which means it is not official yet, and the series
is also dropped from patchwork.


> No changes since v3; rebased cleanly on current net-next
> (after the net-next-7.2 merge).

net-next is closed, please repost next Monday, following the process doc:

https://docs.kernel.org/7.0/process/maintainer-netdev.html#resending-after-=
review
---8<---
The new version of patches should be posted as a separate thread,
not as a reply to the previous posting.
---8<---
