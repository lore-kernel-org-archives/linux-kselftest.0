Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3600B35B12B
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 20:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773694522; cv=none; b=WF1CanWZZQDAlbdK/ku/brE/14MYvNe3cY/zdZhGWc17CQfJjOQoFDuQlXxwjEC/7sZtHe/+Eq1NQJW0VE4gpQGU5e3M3Uag8LQmQuxUFrln/4/wwen+AR09LS6/idDBzSSa5S5TtAXkPA0BtYvJIFbYeSD1kZ0wgZNo/IxE0Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773694522; c=relaxed/simple;
	bh=/HGNrFoLEufWK5e5qzVP4QZuYO8XOFUldCK6WsKjvk4=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Date; b=Qy/Kxst8mzq6/VkXwjFYs2NpRQPcaihw/MXgP7h1Ez4VW1W7wd9Vd46pFSkb4C2BdwDWuUsbXpbwZFyhnwcpE/jr7H8+hVq7yqEOdKJQ4ykannIbC4HaibM4WqAKq2q6RaZBQCQsia7sRDQvmQI6eyd66xx6ple4vUujr6LOGd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bpcbpSny; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jiOH3TSQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bpcbpSny";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jiOH3TSQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773694520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FBXD1FJN/Ut/oszBqEDHIHt1BiwBmk2SZ97hBu1U4RI=;
	b=bpcbpSnyx6LzLN4ocvahF5NFrH/DXRt68qdpbmBWmgdm04tBZh4eLOGmOqqdAi7Mi09Xp3
	UPBLQl/aDy3JoL0/fxSgLe10YvXBOLmKbo4zTO743+k2eCZYVFSpyRE3eohVFldLYwgvYV
	Zt30mjd6FUvCVZ0LK1ACwG7jbOthtz8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296--BRS9PaEO2m-W9UsrevXBA-1; Mon, 16 Mar 2026 16:55:17 -0400
X-MC-Unique: -BRS9PaEO2m-W9UsrevXBA-1
X-Mimecast-MFC-AGG-ID: -BRS9PaEO2m-W9UsrevXBA_1773694516
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48534941525so74629355e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 13:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773694516; x=1774299316; darn=vger.kernel.org;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBXD1FJN/Ut/oszBqEDHIHt1BiwBmk2SZ97hBu1U4RI=;
        b=jiOH3TSQIf+GKflhpx3yICB41tNybGOXzSKlqyCN2qaZEGWjwndT5LiYfzowxo/For
         SA1rKP6HE2iKFYGMT2QMBtRBaC0+m/uggGHiRZeItJf6lTqJOrfWTm1p7ondoAONP4do
         +2A1pjSClhj9+ibb/tbe4MnhEqBxH6o7nJQg2b3EOcUcLZ8R/gX3d/mUnOk2c0AWwWU5
         hufPEQR0iwmGUUuf8qTflXo8EwEedVwuFPV3XWhCUf50g4XAur+QqZTdUDaPUJEBb+Ey
         aYO04Woc1zWCM7azio1gAsGykXVGLM7tRWPTcylM8n9+tTMuxWTAkfm3YUJol3ipx4XJ
         LYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773694516; x=1774299316;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FBXD1FJN/Ut/oszBqEDHIHt1BiwBmk2SZ97hBu1U4RI=;
        b=jJp8jIZktDG22a44s2gyt/RregBTxKYmSL5d81wHuCscSb8j/MrW2TJPS2HvvVXF0p
         Zp3Tzv6J/Gmo9nUf20nxRnqm7Mp/1ChEV95wxDo6t61yRX+AP0G2b1r8FJCjOkAWRySU
         sGZ7oAm6685hqE3nu/QD5EuPZlo0HNt/5AuFzQkDrPcZggZvvwU8f9fj/CV6pF/yzRw8
         UeNviKsQqsUg65s+ER+8wfqqi2owAzp0MsiiXiAd6EM3VbJRUEO36WtqYxm7L9rc1mhp
         iye8VziHedPVDDoCzI1+IAGRSXj0mICIuJiG9fIqX3UiG2hyzgBn1gOKWTmQGug5suqa
         oIuA==
X-Forwarded-Encrypted: i=1; AJvYcCUqexiVtdQPmW9lLGuAr30IxKk/RTyqSAOCthxUhLMFQa+oAv3W7zOPZtnytLj4AYKti7z7L/vxMGXOpSymahU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNtxEusXPuSXOLcnODJxlrC8AgQnII6MtILIS0nkYtU0IYcpNZ
	tAyfSpQujl96gqlI6ZtzL6O2bwnGSdXc9ykBDf3ZsnejhGJRSLRfI3TQExS5GgByTBl/lIjWWhc
	5YLzPBveediAcfh8+Z5OjrY8g/jwaG+0fw1IIJubnz4D9mGJKPiE3Hkc1LqFkd/7JXbwRGQ==
X-Gm-Gg: ATEYQzyFKsK1DKeo6UZQxht5xMz2PdeX/1olESVHM7ZzW0AZrsPXzOIPckTbxy/6WxP
	jjklK8MDCzFfvDioB033tz3Jht/uTKyMlmF9gyGQ2L6ghpnQT4UOrA1ytqiC5xUb6kbA2o+ljZV
	udXECcMPzOZ4pvxrWDMOUzGzdI2w+t+g0GUtw2YsTd7wNrlA1rXXyE1FN0astVnp90BVp/+3eh4
	LnQxidD69zDZhP/Q92+ouG6+qCS2mqik9sHr7WbgkhW+85cAIUfumwvHvxGjCnmnCbqMEeJoWDn
	lJypxlpoeJGeIgc2gLeAzQnp0lRDAYczLtI5AtOXm2paNfoHAKTrMyIpehgxXjFpCL4ZfET+GF3
	ZHFPjnAFISwnNRDWcsdJsSWG69fLPb/MeI2hT23EQrNBTrWGhOQ==
X-Received: by 2002:a05:600c:1388:b0:485:2fd9:3d4a with SMTP id 5b1f17b1804b1-4855670283cmr239646535e9.22.1773694515951;
        Mon, 16 Mar 2026 13:55:15 -0700 (PDT)
X-Received: by 2002:a05:600c:1388:b0:485:2fd9:3d4a with SMTP id 5b1f17b1804b1-4855670283cmr239646345e9.22.1773694515550;
        Mon, 16 Mar 2026 13:55:15 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [176.103.220.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eabb6edsm13142265e9.15.2026.03.16.13.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 13:55:15 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Cc: Jakub Kicinski <kuba@kernel.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Aaron Conole <aconole@redhat.com>, Ilya Maximets
 <imaximet@redhat.com>, Eelco Chaudron <echaudro@redhat.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, dev@openvswitch.org
Subject: Re: [PATCH net v4 3/5] selftests: net: rename pmtu.sh to
 pmtu-test.sh
Message-ID: <20260316215513.3f77af19@elisabeth>
In-Reply-To: <dd1f8981-b8ad-4a4d-b6c8-3333fb05c93b@virtuozzo.com>
References: <20260309152013.565216-1-aleksey.oladko@virtuozzo.com>
	<20260309152013.565216-4-aleksey.oladko@virtuozzo.com>
	<20260311201057.049950d1@kernel.org>
	<dd1f8981-b8ad-4a4d-b6c8-3333fb05c93b@virtuozzo.com>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Mon, 16 Mar 2026 21:55:14 +0100 (CET)

On Sun, 15 Mar 2026 20:25:31 +0100
Aleksei Oladko <aleksey.oladko@virtuozzo.com> wrote:

> In v2 
> (https://lore.kernel.org/linux-kselftest/f7t1pj9v8h7.fsf@redhat.com/T/#m80f10ade0ba8963ac6b09b8aba07163cb3e4cf59), 
> I was asked to rename the main script for tracking purposes. Should I 
> proceed with this setup?

Ah, sorry, I missed Jakub's comment as it came just before Aaron Cc'ed
me (that's the Message-ID above).

I didn't consider that when I suggested to keep the current pmtu.sh as
pmtu.sh instead (this seems to be missing from your quote). Never mind
then!

-- 
Stefano

