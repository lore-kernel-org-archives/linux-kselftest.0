Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324243161BE
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 08:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770797815; cv=none; b=pB5DcGCgbCWi++QCQtsOm2WIQjK+Gs8H7+MLkyE+T+8b4iX3EPqKAunVBc7H2Edl+LALbt/ENvuhg1zfb1Z8OLjnwsQHSLL59auRPD4ymZ9MHr2GzR/vZYK4D3FbzIXMGpFZtClrD7PcQDA0+XRX6QcxoNfBADMqfnMhdHQ8DFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770797815; c=relaxed/simple;
	bh=YVkdKE56KfMUt8ZBwibIPxcn0zR1Ob7YbeDJslFalXo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k2668HAeNrGh68x255grFVbNZZSoGBjESwZX7F/9P5tiPLr1pUyb2toGqlGq1uFhKXlHx5ivmru7JMURteyzQ9sXd/lgKx0Xn1s64+vP+eUml7fkMiN60wMi7JLZCk0FeWiKBhbGPzvvUnK6fLQ7We6W9cuHzx9xhcGydmET/SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pdve4/F1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VSXSHcF5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pdve4/F1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VSXSHcF5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770797813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2SX4sleE5xgzwOzs5l1BotG3ooT9aeHoVAoWb2ZNeBo=;
	b=Pdve4/F1RyOqi11Ac3kpqJWkqn9DD0348xqL3dYzGxlhYs27M4kj0EZZmxCRakp+CPydBG
	OkgNn18DxMs8LizSq5jMPHiM8yCZbT92jhyTzw3kvSrhnbuwcW51l3G6T0xMGONuLeGJIr
	OqjgGnqcJHeYXOHKFQBdborSsrezLAY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-bp9xQCeqMeev5HV0_h2PIg-1; Wed, 11 Feb 2026 03:16:52 -0500
X-MC-Unique: bp9xQCeqMeev5HV0_h2PIg-1
X-Mimecast-MFC-AGG-ID: bp9xQCeqMeev5HV0_h2PIg_1770797811
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47ee432070aso46343685e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 00:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770797811; x=1771402611; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2SX4sleE5xgzwOzs5l1BotG3ooT9aeHoVAoWb2ZNeBo=;
        b=VSXSHcF5W52gakw8VWXuy+h59g5EVrdCsJkus9yNtUdRxFmkGY8XE8nQoIp9zlHxCR
         5udMQ0uBwAhbrCorG0xgF7MopnSmdbOB14spdAVIopPkRuMYzoDsgTXL1pfya8QRGXuH
         QOJfrmbE6PfwesERG4b759VEXWC09Srwu8n4biQ4nAVEsEpT5IhOwbPJndCFzuCOMiyj
         xggIUtaLi/gV6vatYsTTaOdKru/deAg2eHXSJiHUhVNZhry4Yx4Aw3YI7XxgyBRFd9qE
         WqTlnagIzyNoy9frXPlfnP1XTtypip31F7XHAie9EsT67PSVIT8k2W6rNEtbfF5nES6P
         wK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770797811; x=1771402611;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2SX4sleE5xgzwOzs5l1BotG3ooT9aeHoVAoWb2ZNeBo=;
        b=jttDS4Sfxpqtikshj5YH2X+CQTzwLcz/iEUeCWS3hi/vrLrlNYv7jBQNbO0bt5qb3M
         clEGZm3EX5Qgo1oMPMCIy0ZSKgx7oCfyM0I8+SdZOv8xKg07Co77dFnnNanGp6X2U2j6
         X2uiCkjN28cbJfFZz0qECn3mtIAGzr81Lb7DZr9KBphd0YkoAy+dCnq+/dTBdkqpV+Fz
         5dyhRQx4NAQIsOQ8K9vJUXZlYYzTEBcUZMFJYiNrN17fFGv/YY0vVlWrzBMcWKMAQDHX
         jZKo6tLKFcvq/qpoG8XgIK2+tdUtzbb0Er18aG/UDbm1TBjlHOxX4SBJjXxA1OLc4JL3
         srIw==
X-Forwarded-Encrypted: i=1; AJvYcCWVhvx+mClgzZi7vrmZ0zMHKFQX8siKjBTN5x05ZHuwswFNjaFYpQ5tD6w5zF4+icvxIyPQUISGMqXL/UhWe+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbTOYl+gAhUy5nfNs4MaGDdhw+d6rEIdO/6qQHfdxWaNJpYKPf
	3gfLQs616G8BFv9F9yI2FUP93mArD0UvkfqTKDwNLOQH/+zfMPVxtavkC79hgmxHQDPaLMNlRis
	N24WE4n4SJu/QrmEo6WSQXTQMSq0Ew8aRFydUnFZLalp6LFFwTupDIMsV9yAvMD2gY3w/6g==
X-Gm-Gg: AZuq6aLFUzji5oAV+FNygdw6NvopsqukK+pL4qmN4cJeFb4e23oEzisIVyX0rAQGXCK
	hR6Sd3xrbg4v8yZsL4TlPGeqYzVHGnRqCfWhwaBBGZahknbagzRBO/hSPUqoG3Z8ulTu0TJD40M
	VcwygAdXb4hkYVdKUbF+cZLIIjU05uaS7NkdO3p3kCV4Au/GSX2AiT36OGqNvBRGzzF6xiqvsQn
	w2Q3d3eByN4CX4Z7zpQ76VpkrY7kj2CRbQyEv2sWWvba229+bf3fKCUFJy1C9M8acc5c0LinZBY
	StvFi4YBtxSwdNILxVDHVfsGeg1BoyhmmQf3yx/oWcktgQ2GmTH0APOxHgElnX8K3/VeIsXHz5m
	cQS9c2+RPtJGDxsoCF0d46B9kmj8xVaont9p48IjPYMgkM4+10by2oLQZpqZqqf1kZ32ymWYflT
	fWOzvfnWgywWiawNRVmMvG
X-Received: by 2002:a05:600c:a00f:b0:475:dcbb:7903 with SMTP id 5b1f17b1804b1-4835b90c8f2mr19871385e9.9.1770797810758;
        Wed, 11 Feb 2026 00:16:50 -0800 (PST)
X-Received: by 2002:a05:600c:a00f:b0:475:dcbb:7903 with SMTP id 5b1f17b1804b1-4835b90c8f2mr19871115e9.9.1770797810288;
        Wed, 11 Feb 2026 00:16:50 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (185-132-178-103.hosted-by-worldstream.net. [185.132.178.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d9895b1sm24073995e9.1.2026.02.11.00.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 00:16:49 -0800 (PST)
Message-ID: <ada4f1dc5ca34d8adf3d68396080e6d2e5e834eb.camel@redhat.com>
Subject: Re: [PATCH 1/2] selftests/tracing: Fix to make --logdir option work
 again
From: Gabriele Monaco <gmonaco@redhat.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Steven Rostedt
	 <rostedt@goodmis.org>, Shuah Khan <shuah@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Date: Wed, 11 Feb 2026 09:16:48 +0100
In-Reply-To: <177071725191.2369897.14781037901532893911.stgit@mhiramat.tok.corp.google.com>
References: 
	<177071725191.2369897.14781037901532893911.stgit@mhiramat.tok.corp.google.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-02-10 at 18:54 +0900, Masami Hiramatsu (Google) wrote:
> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
>=20
> Since commit a0aa283c53a7 ("selftest/ftrace: Generalise ftracetest to
> use with RV") moved the default LOG_DIR setting after --logdir option
> parser, it overwrites the user given LOG_DIR.
> This fixes it to check the --logdir option parameter when setting new
> default LOG_DIR with a new TOP_DIR.
>=20
> Fixes: a0aa283c53a7 ("selftest/ftrace: Generalise ftracetest to use with =
RV")
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> ---

Thanks for catching this! I should have tested all the options..
The fix works fine on my side.

Tested-by: Gabriele Monaco <gmonaco@redhat.com>

> =C2=A0tools/testing/selftests/ftrace/ftracetest |=C2=A0=C2=A0 18 ++++++++=
++++------
> =C2=A01 file changed, 12 insertions(+), 6 deletions(-)
>=20
> diff --git a/tools/testing/selftests/ftrace/ftracetest
> b/tools/testing/selftests/ftrace/ftracetest
> index 3230bd54dba8..0a56bf209f6c 100755
> --- a/tools/testing/selftests/ftrace/ftracetest
> +++ b/tools/testing/selftests/ftrace/ftracetest
> @@ -130,8 +130,7 @@ parse_opts() { # opts
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shift 1
> =C2=A0=C2=A0=C2=A0=C2=A0 ;;
> =C2=A0=C2=A0=C2=A0=C2=A0 --logdir|-l)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LOG_DIR=3D$2
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LINK_PTR=3D
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 USER_LOG_DIR=3D$2
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shift 2
> =C2=A0=C2=A0=C2=A0=C2=A0 ;;
> =C2=A0=C2=A0=C2=A0=C2=A0 --rv)
> @@ -199,6 +198,7 @@ fi
> =C2=A0TOP_DIR=3D`absdir $0`
> =C2=A0TEST_DIR=3D$TOP_DIR/test.d
> =C2=A0TEST_CASES=3D`find_testcases $TEST_DIR`
> +USER_LOG_DIR=3D
> =C2=A0KEEP_LOG=3D0
> =C2=A0KTAP=3D0
> =C2=A0DEBUG=3D0
> @@ -210,12 +210,18 @@ RV_TEST=3D0
> =C2=A0# Parse command-line options
> =C2=A0parse_opts $*
> =C2=A0
> +[ $DEBUG -ne 0 ] && set -x
> +
> +# TOP_DIR can be changed for rv. Setting log directory.
> =C2=A0LOG_TOP_DIR=3D$TOP_DIR/logs
> =C2=A0LOG_DATE=3D`date +%Y%m%d-%H%M%S`
> -LOG_DIR=3D$LOG_TOP_DIR/$LOG_DATE/
> -LINK_PTR=3D$LOG_TOP_DIR/latest
> -
> -[ $DEBUG -ne 0 ] && set -x
> +if [ -n "$USER_LOG_DIR" ]; then
> +=C2=A0 LOG_DIR=3D$USER_LOG_DIR
> +=C2=A0 LINK_PTR=3D
> +else
> +=C2=A0 LOG_DIR=3D$LOG_TOP_DIR/$LOG_DATE/
> +=C2=A0 LINK_PTR=3D$LOG_TOP_DIR/latest
> +fi
> =C2=A0
> =C2=A0if [ $RV_TEST -ne 0 ]; then
> =C2=A0	TRACING_DIR=3D$TRACING_DIR/rv

