Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3584F3FD13A
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 10:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002693; cv=none; b=Qxe7JsEvBvWU4SbgZoy5yKyIu+jI8R98hVuOG8n6yIEfMkVGkuWwsQEKhFWSpc+jmQSlNgkO/3TcJhei3UJycBlqUfBy7f7AfuOsavk6+p9/bFhjbt0LXE3PyLaJTd7tSJU9/oeC/J3vYc3jP7CC21RGIUjPlnKrxGV19LQbF2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002693; c=relaxed/simple;
	bh=JveCsx9Hslr13u/DSY0be/52qVCMiadnjjogqq+Li1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tj608B4padekGS89ldatz1BE9kU5Wn+Spm5058gFzh35VCqcJSB/Z/fZ7inUDismAzuOOW2mjLBNpesilZHinnpYOFoVMS2ca9hJ3+iHPzKHVd0P0VvECMXtUOFX+yr3tzhh/pJKZGzQCxrYDwZUbEQ0yraR8sj+ibBSvADN1LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AEcxVQxi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y37BYBNG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AEcxVQxi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y37BYBNG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781002691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DJCMh9QJ8mzt02qiZIC/NXMj7sB/BVWq0X5RNKCrb0M=;
	b=AEcxVQxiLlbAK5+Ka4cYQCjc2JdNm7eEFHmhnAc9NTn04tEJoi+ENL7xqAUO+3LDZ7ES1w
	zqucHpxme5BSWvipJy0tpB/nzzt6/8062pfG0YvYbBnrbVlFyWzYaSSERBmxfMcG+SNoE7
	1g7UwucoM5D+NEatkitdFmFuoQABULk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-x91MSUKPOWqAJMMMBpDkHA-1; Tue, 09 Jun 2026 06:58:07 -0400
X-MC-Unique: x91MSUKPOWqAJMMMBpDkHA-1
X-Mimecast-MFC-AGG-ID: x91MSUKPOWqAJMMMBpDkHA_1781002686
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490b79e6b94so39006805e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 03:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781002686; x=1781607486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DJCMh9QJ8mzt02qiZIC/NXMj7sB/BVWq0X5RNKCrb0M=;
        b=Y37BYBNGPwbSiyc7JXQ8gdYU9lFaLeC3essTMnVF4+pXhNtpqcJwiv1HDXOLR+s8q2
         SvQfapt3g17/NVkgJAVTIXgTmThEfNyBE1H6/af9z6Xteo5+ozlnmOKPCs1p3CIUW/Uk
         axcQl4sWVdbDNlHc0tCoC/A/G4TypF228Wu43zJeDfYsuRQPbPoWp4Z0CTOX6K+T6gkE
         YRp4wNBGxuJ6AmDUA8C1VLKpI+yhAEWeam0Z/6C87YmOmLldW+y8wG+zSk0bw6d2gsrF
         BDlPT0HxUAUc7pycKk6DdYsP3lARw3zKzA4wDloM6Dtq7PW591d+vcCrMO7Yz5D6aY/7
         7sIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002686; x=1781607486;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJCMh9QJ8mzt02qiZIC/NXMj7sB/BVWq0X5RNKCrb0M=;
        b=tOrUNo6HBlmdhg0ofFeVkeE9zmJmY2dS7HiSevA8hVIZVpirwtMnKeayI7iHnqnIOp
         OdYsuj1iiGcCJ5ZWKt2+/GKKHKmBFFYY412TtNE4kb3aGFzf7lWjPIpvP6Bd1umoTabQ
         g2mrasoGcdonsJx4x7IbCaeu69y6katvzlQjsSLAjyCcy3RUyMxUE8WYp4pMYJtPuwKO
         +h0kv9X5jeBThLcfHJvs1UtY2vnUUS3DRMt35pIUeaVlKk0mSwn873+YAvGWVwJ31wAJ
         hGN/6rxHItIiP7VAMw7XDHg2bDFzKuYb6WhRMwEwaLO08FXu3X5H2Oe3En6rgw21HdfF
         aQNg==
X-Forwarded-Encrypted: i=1; AFNElJ+kn+XLvqU/s1R+k8pQeGI9OfXrvpvNuycZMpDDYLN3HZSfHbp6e2bjtXzGDrWID5lU6+98HeE6sWOnD/nCQ3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX4+1XXTvkSH3tcgVl77Ls26evDabc72trdsBC+CxnCwwCu+AC
	YY3Abtw5wGTc3ILxP5cM8Blnh64We3QCmqbGNfyQvgaMFDHdirI1qkowaaLolTwwHcxO46XDf7E
	gci5lkFzOp2XK0cTP7t9xJ6eEN2t/QWHoPRky0qZrwPj8sSu4AmbmH3JeUwIF2CKBqN+FAw==
X-Gm-Gg: Acq92OEqWbbt5jlXRFadvst/PoZZXxqCFySUk8IblxctftdYL4tqy4MxqpISVoIAuZK
	+yZl7k6SBK2UNDzYfy/ZSUHFP1T4pMNueu8jxz0mPFN1sdBAcFfIEOKExhkrL+KHUiAKX4AZUaq
	bSldyjaicraJF1q/8BkiSn1MY/MfPvxWtzOmF5B+9ZTTKdXxaEZHf1QQjtFEVTmTeH5sIK+Dig4
	Y9zdX4Ls61BYJsuNo2IcgOMGS7QCW/+fPCqKmgIb0JJ6gFu8bcWZTTcUqJT7cLeUd6UpScqOOuZ
	+gxMUN+rvln7jYpnGYOZtC7vTDMHzSztWpX96V2rX3uOy1NFzHF5q0RwvMHufpWtsoRUBix5V38
	+IAqWsgGhJa04VZlC1RbIOYxCzNefPV7P2RvVY2BKBpAOfjKQ7aWoc8Fznq1QQtpD2w==
X-Received: by 2002:a05:600c:a51:b0:490:b189:212d with SMTP id 5b1f17b1804b1-490d724314cmr25872605e9.33.1781002686460;
        Tue, 09 Jun 2026 03:58:06 -0700 (PDT)
X-Received: by 2002:a05:600c:a51:b0:490:b189:212d with SMTP id 5b1f17b1804b1-490d724314cmr25872295e9.33.1781002686079;
        Tue, 09 Jun 2026 03:58:06 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39eb04sm477699555e9.6.2026.06.09.03.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 03:58:05 -0700 (PDT)
Message-ID: <f4643f4f-8db9-4621-bc53-34992820ce19@redhat.com>
Date: Tue, 9 Jun 2026 12:58:04 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4] selftests/net/openvswitch: guard command
 substitutions against empty output
To: Minxi Hou <houminxi@gmail.com>, netdev@vger.kernel.org
Cc: aconole@redhat.com, davem@davemloft.net, echaudro@redhat.com,
 edumazet@google.com, horms@kernel.org, i.maximets@ovn.org, kuba@kernel.org,
 shuah@kernel.org, dev@openvswitch.org, linux-kselftest@vger.kernel.org
References: <20260604163016.3929371-1-houminxi@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260604163016.3929371-1-houminxi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/4/26 6:30 PM, Minxi Hou wrote:
> When ip-link output is unavailable, when the upcall daemon log has not
> been written yet, or when pahole does not know the OVS drop subsystem
> ID, the affected command substitutions silently produce empty strings.
> The caller then passes empty sha= or pid= arguments to ovs_add_flow,
> or matches against wrong drop reason codes, all without a diagnostic.
> 
> Add [ -z ] guards immediately after each assignment. For test_arp_ping,
> also align the MAC extraction to use awk '/link\/ether/' as in
> test_pop_vlan. The drop_reason guard returns ksft_skip because an
> absent subsystem ID is an environment issue, not a test failure.
> 
> Signed-off-by: Minxi Hou <houminxi@gmail.com>

Whoops, I unintentionally replied to an old revision; same point, I
think this is net-next material.

@ovs crew: WDYT?

/P

