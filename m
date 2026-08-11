Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18443803E9
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 19:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786476024; cv=pass; b=XYGGXFiGqehn/U2gA0bQjmN702DOySkgbydmWd3JIKT/FLFfIaG3yImuqfSAplJ+5KQhXIVAFLcdwhEfN8vYnQOE4BAXD+BwRX7A7HP1+z/L2+bKXiNjRCnmFpnkpAsOjxOYmTd1suj4jRMaT24jccq6kx/hnsPzK+VirizeXpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786476024; c=relaxed/simple;
	bh=C0tI9qUXL0/pdjc8WBu7cnqr0pTI/K9DzaSGDO9Uh+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxFnd4z20wsbdolfU3hnU7lOKOKMJtuQzZD03kSaydguZ/HhzMjrvJbSJEVFz051+iiODmq8VYWSn9Ob9x6eD0d7IzXCC7yCsNhkr7rqSo+V0FygP5WiDZ3OL7keoWliHWT2TXJQbU1kvqZWVyZjyHHeV22u0VbET6dJzxz5g2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCU4SOrz; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCU4SOrz"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f703a9d05so96303f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 12:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786476021; cv=none;
        d=google.com; s=arc-20260327;
        b=T3L8VmyfwNwe6oLNpnyUc7FIhc4Q/aocaKULJ209fLjHN4n8oegjHw5PM+vESqkCgi
         ct8dju+GRtU6eHvLhzZ1b/jXmCEZSDFRD7/0CpdmojvTVvmqRXq78A3+EskQ1gH3k8OK
         bD8JJrc5Hd9FAbKEHx3DZ8hOT/4SKk4ITuCQeCpTuN7n88hw1+3vTBVPwYisaIFULdpU
         BCKyLX/CnjVKOlDqGG3hGpluowhGLypoStXp9kqNGdFYaW73EAPPp/ECy04dYGpxaagt
         j+0Pr5Pr4bnGouQ1DUk/I3LrSl8nf47pyEv9iGWa8h4B21TwIwWn6A1EZFR79cHbDV/3
         31QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C0tI9qUXL0/pdjc8WBu7cnqr0pTI/K9DzaSGDO9Uh+8=;
        fh=D5pcP9Zm54U26vbs0AXh3ex7fTKGq6ATeuHkLzexQFo=;
        b=L/e/ROBp/gCBP/mQqmRXK83liP6BstPjXPXW72jyXQwJHow24K0WX07cROhE3rIcMK
         mWq2eJjtMuMO7k1/rYr+WhJiJ4UTOtuCLHmn1x/RlTWoaGc63bCVWNFTUNpHpoEOhUl0
         XbbNf+GAWVTEHRkfu6o3tPo3Nx2iVzOKE/XAId0FoRTBusQqkFnEgXMhNkdg6PiR7tBa
         7DNTy2xVqX8EUZtcMecno+hKuGOXoLwejPku0e+jMrGBB+3pdmhNI3VnC2K3HWOpiUQO
         NCVh/WETRT6R+MtJKpLG035wTxIfZ2u5pnrDQQtQcuSQuxLKwmmUOPruzwlEiG1BkkEn
         YGBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786476021; x=1787080821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0tI9qUXL0/pdjc8WBu7cnqr0pTI/K9DzaSGDO9Uh+8=;
        b=KCU4SOrzWqy2IGPAUvIoWgHGsdDmjZ0xtWdy+5OE8QtINqkuG6paayEDj8fYQvSmXN
         YkkVQtJ1jFHmAacvjitdXL+xZKfHTEoTrmAkxF1Td3cYwMlCoFNrs/g5SjpuAKE44x1k
         tH61+/ZoFzsOPDph9OIZVftPAtYTcyyZc1EED1WTDTC0DSBj4X3I8mYtl3tX6zxvPu6u
         oa3DG34cEkOTn3Q6gT/pXl5j8FHnku5qqMhYlJp9t3eZdnqO3JylhnGWy1wy5Iy9ZagL
         J1WyueYEoVJzO9ob54fIZBR6LOe/reYlkMriCXjWywLxwNi27ykGILPw05o62TG8+50H
         C/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786476021; x=1787080821;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0tI9qUXL0/pdjc8WBu7cnqr0pTI/K9DzaSGDO9Uh+8=;
        b=n4Z6qZ6pgNO/kv+U2hjdXYngnguISP8zRfILFfS0IsOoUipwkDq3xmIV8vlVeF2QNw
         rwlNH5q4kG6CVWEy01eVzoD2jcyfsRVK9V1wXc+4bf2sCaZ+vJtAcdyjyzN01ghxvOUj
         rwrsT9dOpAxU4k36M/3arCO6/NLucNd9g8wbpKYhbvlbkOm0bqgEEmB73qW9EmXllvB3
         QdS7UnldeyJ/VDv44nWa6uBgXE/0bOojypqSwCoCeW9ylsZ6oVd9LNHFLkEzr5AD6stm
         PTFHsTbiqN26X5pPibhLZBeridA8uMlw0B57Fyl16mQL3rJHhabCcdhIQAf2YT1ZeHU6
         ioKA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7q+XtIH2ItpV+KtiDu880WXgUOdSqlYa7qzMfa+ot4PNWdWi8ca8SPEtcCuYw0qHEaNtzLmKC6GsGI/+6cpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB0u9J5CQft5O1iB5wtg8w7PfHnKk22MYjrjkMgBX4+x41Pq92
	QHaBCQ94SGl3yj/F3/25ZsIGa+CvFSERDqwdZHmpFd/rj1KEVDAdRdkvDyhMCId4bFbQVt4+meS
	3ZkkGB+RR8/D5FBv26dXblcLFd2Cjuoo=
X-Gm-Gg: AR+sD11MTWCRRaltqJQ4uK5Llyw3yPUoV22Vqa9cfIVZfB/YQ/nqDaVCXy2u3P4i7QC
	id2Qmpq+70ZYU1JHNZdBG69oKDUxG8QZxzWepycqs7BByOrxYHuDjS3bopknTo5+izEJke9xTLn
	Px4q8OutR2+9h5BMBuDOuVXv+LV0HvG3GRaW7pJKtm8K2PD2XO86MPupYKPehGbt6g3ePLgz61C
	Leo53jmXSeSNaOtI0wf2cTtIajj0BrfdrZYHcuUFdiwmMbGbH+BUotnRVaa3DB6EvyxnhwC27aL
	KHfnwuBCEq8j1+jo4BhQnuNzukfBzgQmduIkKNcnB/16RFddbGYNNHhwTZNHmESa/QPaaKVjc89
	C
X-Received: by 2002:a05:6000:2687:b0:47f:d072:87d7 with SMTP id
 ffacd0b85a97d-4814ad8531cmr9844062f8f.9.1786476020845; Tue, 11 Aug 2026
 12:20:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811051434.3805648-1-wfelipe@google.com>
In-Reply-To: <20260811051434.3805648-1-wfelipe@google.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 11 Aug 2026 12:20:09 -0700
X-Gm-Features: AUfX_mxREYM0a5ro6axfuWwtuNUtoNVGyXynzVlYalBNbqZUMOkUoPV4WEi7gaY
Message-ID: <CAKEwX=PW8D6z3Oq7o9OYGXV1YF3g8mxq8rGDU-Tjn2FQQZ-XZg@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/cgroup: test_zswap: skip test_no_kmem_bypass
 if debugfs is unavailable
To: Wilson Felipe Pereira <wfelipe@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 10:14=E2=80=AFPM Wilson Felipe Pereira
<wfelipe@google.com> wrote:
>
> test_no_kmem_bypass() needs to read
> /sys/kernel/debug/zswap/stored_pages via get_zswap_stored_pages() to
> verify that compressed pages are charged to the memcg.
>
> When running in an environment where debugfs is not mounted or
> CONFIG_DEBUG_FS is disabled, get_zswap_stored_pages() fails, causing the
> loop to terminate early and report a false negative (KSFT_FAIL).
>
> Selftests should not fail if debugfs is unavailable, and it should print
> a message when it is skipped.
>
> While I'm here, also add a warning message if the test is being skipped
> due to totalram size and make the check for totalram more readable.
>
> Signed-off-by: Wilson Felipe Pereira <wfelipe@google.com>

Acked-by: Nhat Pham <nphamcs@gmail.com>
