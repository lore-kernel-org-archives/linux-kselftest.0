Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3440364929
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 10:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776941729; cv=none; b=QpTbcjdgEYBMBuhuA/mJ3/3TpWcJygLKTxYLdZi9BJuwi6koJO/MeNC14Q48zEo7JfKDL7/wxolxj8J/kPetciP2OJmyaT7sx9vFlGFURqEyajURNidClOdElBsfsk4P/TKPCFRNpil6pLDWCdi2TA8vRdZgGPpxGmgWC81KUiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776941729; c=relaxed/simple;
	bh=5rbruo5z+OCWzRyxWrt32IDfWyuwr5zrz/uWtP0m6r0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Aj6BVOJtqHo1FLfoOJJxNbilCRdQIBwNU6lB2dFARD0mxw2SMInAOFXx3DqGFPCf/glRpvlNjBY1oPVecejcqWuBjXgXYHL1sXakZ+6rgYsE1EN7968Lu67spkKQQzsq+zP69nBlhbNbQbJgosiRl+XWk9lvx3TjWuLfH95RLGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=RNq1nufe; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="RNq1nufe"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7dbe07d3ec3so3321560a34.0
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 03:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1776941726; x=1777546526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSIA/W7Xb9zRDmykFE/u2Zi49bGSWsIp/IaolcqvyiM=;
        b=RNq1nufe8MCsvNYh1BAyX6OQNBlNLlkUh7GvgqEbYy+WpBI1/eayMqCv0fcWqJ5hd/
         c2v0TpyzLwwC8UhkyXBh78KcSzaY3Zz8a6HCRUCmK72mZyAojoZyhHDCkoHgeLipYK2o
         QfDDdqF0bKpA59urU9uAkSeUfaQJBezpPIzgyDCw63iUYYHB9PngQTJRoteYMs43em39
         fYFmhSNOZPLECWQXlglaDkJrrBGXIFKdghNG0Zof/84pN4z8vPrI7qObB5Q8L7akK0un
         dfxSNE1V5Kpu9wPPM03v8QrgJhzyIbrTO1yH2M93zHrYvVZK5KY2zFMwXTbjAifNnfZB
         mFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776941726; x=1777546526;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zSIA/W7Xb9zRDmykFE/u2Zi49bGSWsIp/IaolcqvyiM=;
        b=K/MhaN8HMLJbH9GSkFVjbsFlUxlFiRS57Bg7qHQrlNWzUBIE4wUhe2+4UR/G+X08Pv
         HTZQETyJCb+18ta60KkI2bkEPnMAPxuY8WAgpI6XLcIY+sfD1wHWqUX2CTXZFqoTrx7z
         gmcrI2pv5Voc4KuSPfECf0i/HnrYYup4UdycxA6d17Ve/ZkO7k3gSLBpKVBweD5WKx9M
         TLJIUC2+IHnnjDfh+J4hAAqxy3EP19T9Oz4jYJvle1G6zKbD4SmYe0MHWVanHDa3Lmak
         0gxpUREGb/rWTVq7w8clWAS18dn7eZkcqPJDTsu5RelKHo//bKCBpI3yAyIaiLzzhEyh
         iCxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+iNaDdga47b3LKGtDz0q9+Y9Bpw9a1NbXURvhljc6U/p1ej0x0cEKVFbCrNQSll1klu1VTxy4tD/kPys3nFyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwShzU6vZ6OJhBUEc9Y5uPl5Vsebv/QwDlAgVbwFlZlCr9S3xRF
	vhnA9LdIQSlMRlbIQD0K1i19/FSlzX5t6GlZ1BtCym61qzlVlGVg17ck4Oh04b2l7Mo=
X-Gm-Gg: AeBDieuh77OzH0Tc4sl8Lg5lmKoj5TZV8J0bD1DEyTA97KOPClmAUbAgvBBueFgjtN0
	peaNo9Bdrw0ndAHJLcRWWtfeooORynclXF82dEjh1Emccw4f6L5e487UoUihvo0FCkXD5VNDRfs
	aZWTVQohOlhpQpCeO2+a3QT/4F1e578oYC4sNq8hYZYI3OP1lAlAKUnH5/g/sm1cVZJSHMu/Opq
	47gH/ucZH8n1kyhEykjKNLL/AKAOkhSdx/x/K9h1zdtdVW7uw4JJdOrDxaA1qwKyePVz91FkfL1
	1glkscMHF+G1xYtvxxGw/RIxyleEfrv8o1vYliSDM1SXDXsYsa6TPpSpox5wTHxaqVIL/j34cFv
	PbizbCHb3pr0uYYLNdcRuyVtIsmd0Wl8hXYc2kp0LnSQ1orYpYbO0Is2rD/b391R2Un7eQiDLBK
	v+p+1VdNHQrcSHJ9zsr/QWRUTkkb+PtuUadLAvW9FUSgpL2PtvD00pnTLWL4LGCmjnaVDaf3K/0
	/hX3/DzsIzOa7w=
X-Received: by 2002:a05:6830:3149:b0:7d9:71e7:abe5 with SMTP id 46e09a7af769-7dc9517f45emr16975992a34.10.1776941726459;
        Thu, 23 Apr 2026 03:55:26 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcdbef352bsm6106065a34.10.2026.04.23.03.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 03:55:25 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <tom.leiming@gmail.com>, Shuah Khan <shuah@kernel.org>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
In-Reply-To: <20260421200901.1528842-1-csander@purestorage.com>
References: <20260421200901.1528842-1-csander@purestorage.com>
Subject: Re: [PATCH 0/3] selftests: ublk: integrity test cleanups
Message-Id: <177694172551.1095312.2823646900889738261.b4-ty@b4>
Date: Thu, 23 Apr 2026 04:55:25 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 21 Apr 2026 14:08:58 -0600, Caleb Sander Mateos wrote:
> Update test_integrity_02 to allow fio-3.42 now that it's been released.
> Add a modified version test_integrity_03 that uses auto integrity and
> avoids the newer fio requirement.
> 
> Also clean up the callers of _cleanup passing an unnecessary argument.
> 
> Caleb Sander Mateos (3):
>   selftests: ublk: remove unused argument to _cleanup
>   selftests: ublk: enable test_integrity_02.sh on fio 3.42
>   selftests: ublk: add ublk auto integrity test
> 
> [...]

Applied, thanks!

[1/3] selftests: ublk: remove unused argument to _cleanup
      (no commit info)
[2/3] selftests: ublk: enable test_integrity_02.sh on fio 3.42
      (no commit info)
[3/3] selftests: ublk: add ublk auto integrity test
      (no commit info)

Best regards,
-- 
Jens Axboe



