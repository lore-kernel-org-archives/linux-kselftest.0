Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC771DED5B
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 00:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786408382; cv=pass; b=MObTG+1G1lzooy9SZo4iPL9Fjpr3RjRq0549296LBMSXKhMu09tmHR4Mz3QSDM4gUn4Dm0A8uD3ufP0Oj6OIcyKldodpE+Od9pbUt5/nM48ZORiwBwl+zglHuCGmmPLqk5mQvk8OjyuVgFzaTv6Vn2Yt0uqbWD+jWLwp2a/zTH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786408382; c=relaxed/simple;
	bh=XP3TqgakwJylnRUqvCpSJ/dguPAgZa3K7TnNtlOKoWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OjlJk2hn2iOlKXQw4re+8fFw51Tfq8nvKI/bE6VktA6yE9msSd7I+WwpRhLrh83eU7fEQS1/vMhhdbfMZ97WF3jRC9Dy7XCE+Y0t7+ENwqeyXpYRW3f2FnNLEO7WfGlQJcbAE6kwMu2zqzznpKP+ITpv0xNdnij7W7Qu2ldHxGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=syD5YRd7; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="syD5YRd7"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39eb257e9fbso15633531fa.0
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 17:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786408379; cv=none;
        d=google.com; s=arc-20260327;
        b=RWJ2A/0TQ4AiPTweqK35hVLEpeFBQ3fzTlmVqoYK8GhYDn6CJNWVTnBoqDrTbb8E3I
         tRpAnQAFhQICswySRQ6IPS9SoTrKGAgi+/+xdWh7b8pYXie1V8/1SKL/V8Fr73fMCEe6
         9hSL2M9nNu7ZgU6dAP7fDpNtIQJAF8tDYd1mQt28Eb/i6+nm8mnYadj3XbR59H/Sznrl
         U89MAL3Z8mze9UZKDW4Rbl3ZeYpn3WB1n9ppl2kEdd9YZzYB/2YvV242Qe14kcGSPP84
         zerede56R1drxN0J3aa6AOl6z9h/JOtXXfXdceN1f6S7fKtGyQ81u+jYvAp6mCrj9puN
         5RCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XP3TqgakwJylnRUqvCpSJ/dguPAgZa3K7TnNtlOKoWw=;
        fh=AWDge9dyF7n1CTB0eL50YGsTwSejQh8C5S6sfCkArog=;
        b=ldfiv8+A+RRrmebrNbsadkuKSzoZvoXISH5bIC0q1TMRZ8i0dsKy+fsOB1kzu5zFf4
         BHDSWg6Y3sX6cDu18KtzDauHhYSzrd9sn0PaKsC/AyxZSTbN3EPkNIm7SXvcSXQNKzN3
         73pevjL3o4u7tCHNERPG2dx/czh/jx421yCOGjtLca6/EoNE7CSyU+mh6vMQE6xRj3ge
         ZCDeJXC5uBGDrdSCof1yjE2vzZyjibKjXTsgnAfyvmTxEoGq4Z5MLEhmU0ELHxHTHAix
         PImInzDy+Fg+mB3i1UrJqDRfRB2mBrLc1e7PVjGY3jwWmvUfqFnDltJNYaXBuqZhle07
         D9ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786408379; x=1787013179; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XP3TqgakwJylnRUqvCpSJ/dguPAgZa3K7TnNtlOKoWw=;
        b=syD5YRd7IXGXFRTvadkWWLcUQvx/mhgtbJoxEdvzYtkBGAacRD1Q3+KGIre5kQehKm
         5tGHJQ6BhgA6soi4gce9+BjdiJyOdEyrvdFzGAx7dOfcxFyid9tupPaKqWTvXrDnE9wQ
         xWriKWZj+KCIziDJP+9dzCk+zEb6I9JrtNnD6Xmu5LddTLrRo6fqDYzfCHC5cXj9jczF
         axpM1MaQrn8+xXEfkjH6cf1oJFK8Nh1li30Y/j6ZXGAtfNFtdHomRz6psvI4Yeu9TQLk
         Ph/EVl3pK8VyYpWwc28WmeOWOCbwQ5zayNX/6uhh2VFJXN8RNZhsu174Jcgj1cKYelV2
         wKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786408379; x=1787013179;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XP3TqgakwJylnRUqvCpSJ/dguPAgZa3K7TnNtlOKoWw=;
        b=lRnOkL6vOCQbWBQ+9K4ETVJKIX8Qvo9puQt17hnljMLaajRItgLS4u3mXDVrw4Nxj5
         DNTE1Zz2I22G40q5ZEwojjA6GVUNq+HDjEuKlvAX43z6mTIuvtQMKeVN4I75B/is3mgc
         Ii8QnZ7ZSYcd7AYLxtUUMOUxAKFcGuRS2dVicqqlgcch91s9JYz/2rXcl6uY9Q2Uaf/r
         Fe9idslbIQujt+oQtMRBoDsS8P5J9112wJbEvkY+RIgscno3gtxFBpRyuCKc+G2LjvPB
         ctLlm5jnVreOLhMHPUY+cgESthyATQvU4FREik0Q3Fr5dpL9SjPbo21lnqvIAPo75WFi
         JbAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9Nshn4VkvKIlIxrSh7+c78Ohwdok4occ4ELD7ega/9qHnAL6G8FCLSskPws05KD0uKKvpITasiGyivSxRKas=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhHaTwA3eGOZ1eIaGho9A4ALwgfW8qGe9MyG6LqAyrzTdS5RMV
	9KuBZJVz9joKSbDcN/YGNJYC9Fzq749EMO0R1S81uIqx2h4bN5mxbe2wWveQ7MdXLwQCZGyzPYG
	5scAcF8FlY9QJfhHb/X8VDmmqj3NsWaTfRA==
X-Gm-Gg: AR+sD100jhkl4xAP+6Rl+SX9G3+en0ojmgjc3vptjd9cKGC68/UBwPwuWQOcfuqQi2P
	5LV356+ruosDkePCq+NEfcBaDuqUrCE5eYGsmhkYsgmySo11n7iJBK8Xd9h+ZqdbFt6dc+lPpXk
	GJXbow3Fw3xOgv2e5qlCftAffbHRSfIr164szn9TA8460p4pJvEcIX6+aqPVGbN5M41jBtAtPwq
	vryb9xL2cNdAs+xLzepOsP3Qo5/ENgOLyCXbZroi3pM2no7iuIcuHkCZ7ouGMKn93IC3lrTz3sG
	FkNGCOq824j/vdnmbrFXrdiN4GZQL9lj1qRIhJQ4tLQ=
X-Received: by 2002:a2e:be0b:0:b0:399:8a8e:64e4 with SMTP id
 38308e7fff4ca-3a00eb4b61cmr5958551fa.19.1786408379076; Mon, 10 Aug 2026
 17:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807004320.134069-1-dingning04@gmail.com> <20260807004320.134069-3-dingning04@gmail.com>
 <394bdd5e8cd366cacaa6ced8a32e851b43e67e11.camel@gmail.com>
In-Reply-To: <394bdd5e8cd366cacaa6ced8a32e851b43e67e11.camel@gmail.com>
From: Ning Ding <dingning04@gmail.com>
Date: Mon, 10 Aug 2026 17:32:48 -0700
X-Gm-Features: AUfX_mwMwKbovu7w1Lz49lFbZbsDmDoYfjTjvzEPUac9FeFFpQtVZqp2OFhR-4Y
Message-ID: <CAJP4iutckFTf3n3yKwRCt0u3ojWHKbSNX0vJ7TBim5A=En8=kA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] selftests/bpf: Test RCU iterator state pruning
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: bpf@vger.kernel.org, memxor@gmail.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"

> Could you please convert this test to inline assembly?
> The presence of 'likely' might not be sufficient to guarantee
> the codegen pattern, so we usually resort to the assembly for
> tests where that is important.
Sure, I will fix and resubmit.
