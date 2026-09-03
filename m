Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9F340BCB2
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 11:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433579; cv=none; b=cKkcTB6OKsmA/IoqdebtAlAwO2yHWiIZUxHojNcCSLWC556Kf0XEoI7+k1jvUEeXJQxeGxaSZZ6DsYtmCvAFcr9M3qtRKCNwMOLYUJvEGO/lbmUEfZy14mOOKuNmxQ07fzUz36gHNGHV94tT+B+xJQZFpqpDl/FeffYYAiiA1jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433579; c=relaxed/simple;
	bh=kRMsU1aQi5RSNYArF5IobHP4IFwCbZNZ+oBFJRRILgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EuGxXBmyWTHaDvhs3j6MeSA1xacCVCaXDeIXAcaYbZEvHfHFnbZ69ZA4Vw+zX3F+3L5LYqF9TRcWSp3v0/ndQF+KHazQf7bBdZ7qBeBizFFLkbd8fi0mhPDwexVXNhUW2kWlva98+0vAn6vlL5pYg2Vhzgz3cqn/z1ki+j0rYoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sp214kcz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z6ETwcpX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sp214kcz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z6ETwcpX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788433576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kaaI8EpfE53Tx/bzWzG0YZdIemiUc49MwXJ5O8jhTbw=;
	b=Sp214kcz0vpAyUF/Vg+Yt6h+aUjZEJDRUFT4Jp1rOn4WopZM6XtIrBuXf34XG7XHAetigh
	mG3Em6mmooLONq5Ow8Bql/c/diA0xuR3++L5xshad4BkC8Lm7ff0re6wUHVt0GcMvCyyOD
	gHZNue30K2wSS81PhI3E1MrcrL5jwXw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-xcO56A8WNU26FPr_Nadn2w-1; Thu, 03 Sep 2026 07:06:15 -0400
X-MC-Unique: xcO56A8WNU26FPr_Nadn2w-1
X-Mimecast-MFC-AGG-ID: xcO56A8WNU26FPr_Nadn2w_1788433574
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49545071724so15400085e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 03 Sep 2026 04:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788433574; x=1789038374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaaI8EpfE53Tx/bzWzG0YZdIemiUc49MwXJ5O8jhTbw=;
        b=Z6ETwcpXFXpVuftUIu5lqa1Nw9d3+HKr8k5V2XeQzBEDJy/4vK7ZaWM2v11nmT960b
         R0/Sv9i/aICk1OPcE+pvhOngAGGY0a+iHfsAVqEs2H5QNohaBb1gyduTF83i6upt1F2a
         +fX9h35xHfkP9D0F2r7wBORLwa5wcRSZNr1NUD00AwQ/qk/gcNOzHNzAjXfX/FHCtOL9
         BVt7HOyM4P+94Z36otHWh4fdr63Ses0NvN4YEasQ0fxZGEvivcw9qm82zfv0agZJhl53
         kKpfL9PaEgFi55geU+tDx34B/ErQASkmY098RMGoaxFbyVU4odwcrBKmH6lwPc5oZ/dU
         tgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433574; x=1789038374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kaaI8EpfE53Tx/bzWzG0YZdIemiUc49MwXJ5O8jhTbw=;
        b=nCEQ4tWcXk6r7tCMAH79C5zmvV/GdWVTqjpond7jz9xl8Hw1ULGLXjMPTcem25VyAq
         BzBzXaoBLOgF4Q4WsPvHXgTiqezKfaGiaPh6KJ1b4n5+42lNELBYhh1JACqN/83h6DRN
         je8SnhVqBD1dweHLbA0e08XUi+zaTsILkTXA7x4x2NVA2Q9o0NmCVdxztECbCcq77E6g
         n2OTedEM4Elz9jaRYvS+f+kpAlNhgraANKIbBWyI6ZOg5Da4bvIjGeWGM/RvdUA6waHj
         CH2mUlB2y7Mdvo5OX6H7eHvZUl25iZR1kQrMHSkTUb1BXrcMAJ/Pce8Ylx7bwFgOfOYg
         52/w==
X-Forwarded-Encrypted: i=1; AKwUvBytuusK6oDsptDxkNcYRRgv/Z5rC9wYVe3vTa6eIyFylL9bK6ZsbU0GNeoQyPV6WG+h4o3CjSshdwtTjVSYvrI=@vger.kernel.org
X-Gm-Message-State: AFuF++nYnbiHGAiyP0tNr2SaHe2WL5OImOIUKmwqAOAl1HeUiJ1ryGnN
	XGYWBnYyw7RvSGUJZVJyHIHeiCpp6CVdmF+Pc+Q5mILdBZhZx4XbBE8SrdscR+WdsUKYwllR+P6
	25ibwGwwthhRyO6b7f+KKNVTUrlTKdURpFM+4ZyqWL3vtEb6EiFkp2vlP9rObSSUw+0xGZw==
X-Gm-Gg: AYBFou1j1d9EWuENkvFOX+feZRhXI64TZvAHLiJmgdwbA6xwu7gL7f1Wu47Wo10UKoz
	bBXiNjxYlr8qJlxlDiUiEzxiVKPKVtVM18qfj/ifTQKpjLtnmkv+th9S5o3iM7LBYfbVFD0p8s+
	ROXSYxhvk+c9jBQb1mlVQKpWdGkA9fLAA829ZqYmkknE5B/Y7j8W+yKn2/WxWoAz0xGmlRP7+Rb
	IhfPXBOoRkv7cCAQe21HWuUcKpRJOGBTKk4ixyB7Aeii0S9yZrd+tjmnVDGfYgAfnJP6aQYdhj/
	1zINgHyb9+myGd5b2YzkZLZJdtDS5Rdb3QdXgYfbyePzesSAOSnFewiUJudfeIqZPgKI+G7W7HX
	4xul4+poZrtQHRXWV9en6ZVrZ5GciAjyfUZ9yrl307PZ8Z3f3aI5ATNo3opOIrPs65NPjogwIUg
	==
X-Received: by 2002:a05:600c:83c4:b0:499:8ff5:8ecc with SMTP id 5b1f17b1804b1-49ce58268afmr210656535e9.15.1788433573929;
        Thu, 03 Sep 2026 04:06:13 -0700 (PDT)
X-Received: by 2002:a05:600c:83c4:b0:499:8ff5:8ecc with SMTP id 5b1f17b1804b1-49ce58268afmr210655435e9.15.1788433573513;
        Thu, 03 Sep 2026 04:06:13 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80798sm12414481f8f.13.2026.09.03.04.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:06:12 -0700 (PDT)
Message-ID: <1cf3f4de-bec8-4559-a4b2-1d946ead0f69@redhat.com>
Date: Thu, 3 Sep 2026 13:06:11 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,v6,5/6] selftests: net: add multithread server support
 to iou-zcrx
To: netdev-bot+sashiko@kernel.org, juanlu@fastmail.com
Cc: dw@davidwei.uk, netdev@vger.kernel.org, io-uring@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 kuba@kernel.org, asml.silence@gmail.com, shuah@kernel.org
References: <20260831-iou-zcrx-v6-5-02d1d012f0fd@fastmail.com>
 <178839229706.3394541.1555608492152892136@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <178839229706.3394541.1555608492152892136@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/3/26 1:38 AM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 1 · Medium: 2 (3) · Low: 3
> 
> - [High] listen() is now executed before the workers have registered
>   their zcrx ifqs, breaking the ordering that two existing in-tree tests…
> - [Medium] A worker thread that is dispatched zero connections reports
>   success without receiving or verifying a single byte.
> - [Medium] The new CQ sizing removes the implicit bound that kept the
>   zcrx refill-queue producer inside one ring.

My understanding is that the above 3 concerns may affect tests stability
and should be addressed before merging.

Thanks,

Paolo

