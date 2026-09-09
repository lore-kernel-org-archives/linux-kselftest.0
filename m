Received: from mail-yx2-f4.google.com (mail-yx2-f4.google.com [74.125.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DF75616A5
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967545; cv=pass; b=onu/dbYVOc3vYqTqVZHvBJ6Il9qPi1XRK/dbPM2bIft91PHKZ/eXlM8njSJiVpVeGco8PD91LIPiOfqUdJ3iFEb7LqolZ+TqZBoN4Y44bLi/zzVlj/5McQElY7jm4vmGh8d+nabYCxpUZ9qNcX9JXLGs4TBAFcTPDAlngVBqbuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967545; c=relaxed/simple;
	bh=NTf+By+ndM0HUt8niBb2Pg1cCrBiUmo/ArZ+BvcMeVc=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Itr8rLiWFTG01KaFSLyfhkuEOFI35mpolhqUiq8kMdku8Ta5sfGBj1fydTUHo8qVmzUcLYwV0KlDh29j78sqV4AZzlRJQHT6k9Xan5JAoGFhGBarW33Gq5ce7FP2aHs0FjrhQEUnA4kpyeqHkjqXTuTI9OCi82mkUWnZBPk+JU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUl7vdpF; arc=pass smtp.client-ip=74.125.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUl7vdpF"
Received: by mail-yx2-f4.google.com with SMTP id 956f58d0204a3-66fb34fa3b6so2033317d50.0
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 08:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788967543; cv=none;
        d=google.com; s=arc-20260327;
        b=CZ9/senwcb3QUoS10u95Nk8VfLzDXrYUGi5Hx/6DpybuHp7h8yYgTy/SamLw7yJR/F
         aHUUhCbNb/h90Q84Bbzoxax59x7w+PZ7wPaUr/cIkYyk4T2fc7JeQFwyjjqrtb+IHGKI
         xoqW3w8/ML+f8Yx/aFGVX7hKxQjWg41Amn4AhNHU1gaAdxGiEtCejrcCMxzmT+ny4D97
         OU/QMO6+/RKaGj54Iy6xKiwlfeIAVQWRjYq6HQmvIPdp7GV//TVJfT13hKifqjbeZOlN
         I5hfj916mOkKFfPsBCrchp/fhjpIkaZ9ykFu9PiaGRf8E48Xj4HVu1CrkK48VXfk5V+5
         fVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=NTf+By+ndM0HUt8niBb2Pg1cCrBiUmo/ArZ+BvcMeVc=;
        fh=IBLtzo4W5ktGGXN/A56ZaT+JvozCZQ4+rrHFc9UEZMA=;
        b=kN/Y1GCIsFpz42LuQ7l9qOa/m9N5QkDhJN+Y4N9x/5TQMi9QFpnxcbMelRYxhNRbWD
         pJJJ6pBeJU9NSw3B1ZpB1Sri7cC2L5e6/xYGYsx0815St58kI19wmFIh3X7xlrNugROA
         DFymxK7tcGROZwM1LZqMgAAhyUD4VqagUd37E1FrvdquASihaP0nuJ6T1sZhpy8VGIti
         zYUnL5oEwUVtHX29kn3mOChI2fBzCzoKoA5QkJD94WkW292S1b2RQNq3prU1xAhZmn5z
         LPpE5c5Z9r/UgmcN6VmD5NWeI95270HCkvD/jur45nWLxMkxx+DdMYXs3DuA8apjFXUg
         0MsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788967543; x=1789572343; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NTf+By+ndM0HUt8niBb2Pg1cCrBiUmo/ArZ+BvcMeVc=;
        b=mUl7vdpFb3sCeouIaa3a4v3tn8VUZNjeUTtKEytlQYCYTigHmLA4FkJwLlc7i0yQlv
         MxbnDrznPdUwBUAX30jvoQ7XargAqEQZEwpKVxYHuC2CiUx10557QhNQyvevSiOgrVa+
         fa8kx1GtNiOw3dRK2ZMI0q29CQlNWk9aLkCDwSJjAPKRiDtaIEDCdg2kqXfWdV3SuokT
         CEZsU3F+0zlTvegg/C0jcXCAUIKr0jqOvCi3yU+ZBE3mJPzxr1aXk1Jh7KXYiTbmBBZs
         3sM2hnUWy46zHf5bEnpriNIvi6dehr6RusiUzyEOXfQ3Cklfkr18yjnCXy1GHplW24EB
         3jAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967543; x=1789572343;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NTf+By+ndM0HUt8niBb2Pg1cCrBiUmo/ArZ+BvcMeVc=;
        b=HhfbuFzS5p5a+6ZpS/S4T/tcJQr4iHvlCCMoiR/WnwYcXZ2WHa35E+YBnowIWG2f1W
         0n3ZixAvDVO2T1Dvq8DuWzoRHOxSsTeqqOaMhyZCWGyLozoymNiYxQ9MFRvuOlEzweje
         w8VNxIOVwLYyDd9c7J8Suv5S+mzJxIHbACHiRjTkoGiDlfqpFWAZ1FjobS9Jrl6fBGtd
         MJQYUtjSAupMHj2nLH7L7W3OFaE877CYWkpbQzPRUlgSMamr1w+V244XHcVovHuFVOS9
         sPpFGpx6Uo6gfX7SW4p+qWhXzoHSXJn0FCvxibDIErnproi5sXBch3rmGc6yY8IHQJRz
         59ng==
X-Forwarded-Encrypted: i=1; AKwUvByDBJQQVej0BP0X7U/d/rjevxmUTvL1tmSs3/A6HrmrmiTNQfmzrI1LY+K23hc7SIpmwcCXqWCQhDXLNGkerqg=@vger.kernel.org
X-Gm-Message-State: AFuF++kjonq+NFuc5v1meG++F114WhVwpJLSbjhzhn5bsNrn7vEK4HCz
	+o6+Clt/irdl3Oi20v+pDN1GbKNoG74EqnqBfNCsdSLkOQm8JIiNIrlJQKhX1QquTNFm9O2vsbH
	msR1cFP8tjLOCRMs9E/tfXMctjhwHxw4=
X-Gm-Gg: AYBFou38vApjFxNaRUJOIZz/WUpJiWxNEivWwi2eld7uOywH+6xs6Sw2ziXr6e/QNsc
	tGhEzn4orsCb8TN8OKD8+DiaoECRggcxtlsk+W/X686ic0wzgldWr7xrakUS0LNKVkDxe4TN/EL
	ohjiIn7R43EnkQiWjVKkURHlTksb+hXcN75JUW9S8WxIPqnbJ0OTA7OVkOEgUUM0akJ2+hBRznj
	kY2u9z14ColcMetbBd6LOnlYtRd/W944vyTDjjjBtzfmSemtqb6miK5SDf3OwdY+8frsQgucDBV
	4Qb4kRb87ukV5VlY5EP8R9iFcDMN7TgRBHa0Pdd/MOsQS0tIdnsyxQ==
X-Received: by 2002:a53:bdc5:0:b0:66f:c1be:318a with SMTP id
 956f58d0204a3-66fc1be352cmr7235391d50.97.1788967542918; Wed, 09 Sep 2026
 08:25:42 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:25:41 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:25:41 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
In-Reply-To: <c991727d-ad63-46ec-a281-d09980ff08ca@kernel.org>
References: <CACGbirSdR30=YTPQGN-=202jZqiF8gBSewhq+K_fTSNpq=DMhQ@mail.gmail.com>
 <CACGbirTZFsyQhOszpfiHhrd7Red-L_Z_=ke7DbRDe5SQfzi9Pw@mail.gmail.com>
 <bef8f543-ffa9-4cc6-8a7b-6118daf14f76@kernel.org> <c991727d-ad63-46ec-a281-d09980ff08ca@kernel.org>
Date: Wed, 9 Sep 2026 08:25:41 -0700
X-Gm-Features: AcwNN1WmKueNfTKAn_RKSWUyGmYC9EGLG-M4ziRZDzKXzmf-aA6syq0wLvHFrCg
Message-ID: <CACGbirSXP+YSvp=K6q7F2f8-ybgeOs=3OHUw-RNBbZQt81d=HQ@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 0/2] selftests/mm: Validate selections and scope
 memfd_secret setup
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joel Savitz <jsavitz@redhat.com>, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

> I think what's happening is that something in your mail sending path wraps long
> lines and breaks the patch format.

You were right. I reproduced the same b4 error using an externally
received copy: outbound delivery wrapped the diff header and removed
whitespace. The copy in my Gmail Sent folder was intact, so my earlier
check missed the corruption. Sorry for the trouble.

I have resent the unchanged series as text/plain attachments:
https://lore.kernel.org/r/CACGbirTvSoSeNSpMCBiifTdRKKDsKbgk7nfvh=09fHw2b0M4Ew@mail.gmail.com

I verified the externally received attachments through b4 and git am.
They reproduce the prepared tree and retain the original authorship
and your Acked-by on patch 2.

I will use this Gmail address for follow-up, given the delivery problems
with my previous address.

Thanks,
Tianyi
