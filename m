Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0653090C2
	for <linux-kselftest@vger.kernel.org>; Sat, 19 Sep 2026 06:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789799182; cv=none; b=gRzS89zyFBymSayxQ3A+1mIqUOfokit+AqUBVDfWa9PVpESnvFR3fmKMy/zbw7cNW84N5VYpFuvuNT+EeP74tNIGYxRYr+DGx0zw5oTEvKhtxQCCAsRzNHYKKedifq09bfHqJXv8prcXtx6DdP724HEo3PeHdRRN95T6xZJAXeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789799182; c=relaxed/simple;
	bh=RI0ZyrQb4ytJDsiZVvOM12kdk0OUkZvDp4TPA2K7Ci4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MQnAmNM3iN5BX94eLKyOhxa0nCBy+yIf5oR43GsGBceoszK9pYMJntiQhp7CYk/xUJPDiLG1LJ3ONDA+V5O2saaxNkloI7lBLinC+PI5mx9Atl/ET83rsWVeVGxulaRpprZvCZ44P/i7v0lYQGGax3d9XqSfNXVOhDUgmdORHU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMKr1klE; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMKr1klE"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc50d1b048eso1256183a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 23:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789799181; x=1790403981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsbsJnG4mmaQW0/v8FF/QfgvuP03odNJwcWgXIjZTuM=;
        b=WMKr1klEL2EjBRHb9nE4HRvfFZzbj2oGOa64zPPDjO1wXWp2GBSS/kkURwj61Q2zsL
         rhPKDYX7fMcQJ6VBW67WaX57V88AZ0BCFv7+pgRxKECnZt1QV+wyoh5iU0WPwkMfWXNI
         y23/WwFUbwaxvVHGuZIpSY0Zo0BQLW9N/46WpoU/fEqZLAVEFtyozKeKsS6a/d9tv/wL
         JE7MurYL99A8ydCC9E6pBM/yn/HOOEskiUkcqOR/MmFCsi8sb6J/P6lpea4mdu2wBEzD
         7oArvDleRznu4XcBvFWQTpN5nr6ud/6ws+nC0b/Y8ADmU7fIqxHdpL0Q9EIe8EwuyxbY
         +LsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789799181; x=1790403981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gsbsJnG4mmaQW0/v8FF/QfgvuP03odNJwcWgXIjZTuM=;
        b=JnuFcBBRVBzG3OOvbv2b3pOGWK9NDPJnIEv5dBDiKUe08VD/h16g+9SNmHlPtLaTjv
         8qvq4Sq5Qar1CBHprtQzv78UeqnovCzaRD1u+H7NJ0cJsiVR/FiynzF0cQkHKfkTHli0
         zGpfT3Z9LeThSUKzWlSem6Rw5YG3+019vlHKIezT7JX8pegawILZ4d0pTUdN8KEWnFEu
         rhGYUxfqH8FHqdtEFGu8dUaQjkNlCssT+AfaMmWq41kGrRf0q0D11sjKhDQamtiVrfJN
         TJqgM4m2e1ogSeJP+S3ZB0JKJ8v+DQz0LGBLw7Aezl4Cbx3EL0QpPeb0IbPo5iqxvwPD
         8xyg==
X-Forwarded-Encrypted: i=1; AKwUvBxuJCeNIvCVAsyffMO61XoYojInc9adS7E0Wq9eNfb8nxAguI1jtAuLMfRpm23Rk9M4mp8QMma13tHTAiI8HcE=@vger.kernel.org
X-Gm-Message-State: AFuF++kxyRQ54iaJdVnCbI6i8iOgPgjX1MWUBUvVw1/vRpWzx9Oys3yV
	uXDDsWOJYmTaHvpVqGiypUC8SX/Pk9KE8+vvK88VrEqLqj1ghvZVLbUT
X-Gm-Gg: AYBFou2IiQJQgi/lwQhRtw1Gj/ylLhOSZpTbWvgor74xhuo0OAobi6nr8bBLiIR67H7
	r7BvT1QuP6oBfFJTlBexprvvDYNwOrSMK5Uq0OUnMBn8zvWHFGzL8ZUFI60mtVydFY0fGCo+/u7
	hoHhbawxSU+hp1nV2S9eFOA+k79y3sZpMkPzJhHFcDAWdmUkkBDIJ5nOki6MqFo8Za3+cB3ceJD
	AY07XjKGSW+JufiGha7omqC5CpT5OPOyHaFjBw3TPlIXc/S0MMTdjbKvS7RqK4z89JFtbJWgvfG
	sJmhVFWsiBZn2pRvUvow2VU6/3FELz5YoWe8/Hf19DlcXz+p5shew43Y434em9e3dKqqiW/myre
	VfIheteCQe+Q0Dc8bW3iXoFQWBtDp/V14OiIDg3KgP5rdUiBG42vSFNlXoS6BPgXsaqwZhN5HgS
	0H2EzX6+/LXlzO06yYAAHOhL7Rmcft35G1w5xYrabI/awC/lL5E1tfVWoAlXnW9innBOMr0hdr7
	LpnmcjOLu/T5G2y8eFKfM3dRJPznBwVjZFwNMVGwKOGf6X872IaJbZesXb5DXgDWAUdvY5J75w=
X-Received: by 2002:a05:6a21:a393:b0:3dd:a196:69e8 with SMTP id adf61e73a8af0-3dda196789bmr2864142637.67.1789799180848;
        Fri, 18 Sep 2026 23:26:20 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:d11b:773b:fa83:c49a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32da4960sm4310485eec.0.2026.09.18.23.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 23:26:20 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: kuba@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	hemendranaik@gmail.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	tahiliani@nitk.edu.in,
	vishy0777@gmail.com
Subject: Re: [PATCH net-next v6 0/3] net/sched: sch_fq_pie: add per-flow class statistics
Date: Sat, 19 Sep 2026 11:56:13 +0530
Message-Id: <20260919062613.42379-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918155906.13d01c2a@kernel.org>
References: <20260918155906.13d01c2a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jakub,

We've posted the new patches for kernel (v7) and iproute2 (v6) 
after rebasing.

The mailing list threads can be tracked here:
- Kernel v7: https://lore.kernel.org/netdev/20260919060125.38063-1-hemendranaik@gmail.com/
- iproute2 v6: https://lore.kernel.org/netdev/20260919061254.39678-1-hemendranaik@gmail.com/

As requested, we have also posted the latest 
patches on GitHub which can be found here:

- https://github.com/H-N41K/linux-net-next/tree/fq_pie_class_stats/
- https://github.com/H-N41K/iproute2-next/tree/fq_pie_class_stats/

Thanks,
Hemendra
