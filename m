Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FB3223DFF
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 04:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790136107; cv=none; b=uWpzWY82t46jxVejoWxNgbeUXSA5Lm1+n2K4D7QKwMXTrMAgCzF9xw4pU25SU8GreoB3iy7b8U0lYAvmTZOY/hsT+qi/6XwTz6cRrF+qXW0SKKCDkJYkEyWywbXs6tWA+n8rRsfIn4MHgEt7IfQ674LN/oiCEHBhCvPGPIbDCvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790136107; c=relaxed/simple;
	bh=Aiui/GIoJbCp5ePGjQN2o24q/nO6aTBrIxDkg4ISXM8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YVRS0SL7+qBnQrA02YpMZzEsgzVXQSJT7tX4lfXovAcRI0ly9W8DRqu+R1Y1+6e60g4TyLg7fwku8fr7ecSIDO5hpytiWn7SXMvwY1kWJ4/UjGGTVnwL1ewdtpsBRdWpqjNXGMV+OWmyLlJf4nJ6oaHOK7l6gKTewTYN5fy/kY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKTiO1Cl; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKTiO1Cl"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144d60be6b0so207274c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 21:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790136105; x=1790740905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNH0I/YGSZc1C7h8dwe3uxAfPvi2kXhEcwNb2Q7F9uY=;
        b=QKTiO1Cldfh6IiupBczGedk8TcuH3d/+Ilc4weLHgSy7hRQpL5nSAmK3lTnsDc4hWW
         6eK+aOsdJ8IBJNP1UbIHjzVqhCAGkbWrCaWboazJODCTCYRRb72x8qpg7IdtXUSVEJ6J
         29VIE6D4DU/5yI5I7gv1Nzd2g0SIX7TUCP7EdnN3mkpPFwPhx94rF7e1pyKfjTTrwjkB
         FwLGujxUVrnGbaP1a4Tora/MjdH3zM6aJveNkiV+GpiBe2JLGzKedjS7Lli6sV2vcsXo
         dGFTrnGHwajgHe15xERAlkiK9H5qEqfMUanul16AEbK/GpM4uofBZPbfJ+9QXWE0gXcm
         3PFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790136105; x=1790740905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iNH0I/YGSZc1C7h8dwe3uxAfPvi2kXhEcwNb2Q7F9uY=;
        b=qR8iIYjRVZsSZWvT4IhpQS0Y4yN7MVt+ACdfCOgizP3A0SMHuyN3pECjQbt1r35bhF
         JrL2eDZHz9r2BvgafCq6ADEk6VcozxgGGzazdGLhk9JxsP3QHQ3V8bhQUGf7CVFDeFZd
         tMYYh+b5yz+rdTNcCL7AXeQWjM5pL8m6OObriMjAf0sRFD0mp/fV2dPkSL0om/iAsHMr
         I5SdImSYRY9pk2iD8XOhB33Oss9tkZvVXzV5+RuAR5yXcu4IEjRC3iW+j1hcCvHjkRgb
         8zcubiB2g1OJ3MSckYmN9rUDjq4mDoDksw3fzC6zi8Oo+HcQmhx+a4i8kMkdD5O2oOgW
         RA9Q==
X-Forwarded-Encrypted: i=1; AKwUvByBKl33r7gjp9vj9d0/qlWq9EDpfIjGNa0gxm3sXuCSvOQjSpAZ8gCxpglI24mbIaC166vje2R4wRQLqc2uvD0=@vger.kernel.org
X-Gm-Message-State: AFuF++lpCeMIwGjTlLbdfb9WH2Z7JKz78PQS6zhjC9f+XTawCmsDEngq
	hBm37XcHdfyZpZyvfFGPf4l4M2SZwdhE763c1rMsBqn6NjHLC9LJCdqz
X-Gm-Gg: AYBFou2g7+xu1VSM8Dc+Sve9WKQibLYoi1z00Je0vOp3Kq8OO4A1okR0iLav188PqV7
	/nAo4sN+5e0RDM+hheyGG/ELu+ELRXMu8g/9yJ2XnNo4qx6qIQEICq1OkhZLdbxLc7kRrTLIK5L
	CwMS934xyx+/moLEj4JJVJnSGrn2oPadqEmcHWFXDMUuFIQNfWFNKJ9Lj/FMvJnGLa75MepmL7E
	Ww0oI7OJ2pj+OJEPZuO2q2TLA4Fm9hnz+5smGvYFutQMMtthxjtRYV+dO19V1+nExpGlvjeZkcz
	Ms4Gb13M+sKkHNwZF8cZOFqtZfvIOXH+91uMVe2ZKEoGDZTVkrVZufR8ghyLOlN5OhaDjdreJU+
	0GHmtefmPyn5C+DuxUp7cHFNb8/2O8yneSdVVZOn/L/oc5Yqukg15D+CdTYrexxi7XBDrOHvGTz
	dZLGjs119LWg1s4QTHABN3+dpPvyqGULBgz0ltMwG8J/VNfBWBeEU3co3A/aZN4MNjD/PN9YKkH
	4Jb+0PwuJ2mFa/Vzg+U38Es72kS45Xcmc+LFHoAw9V6eGP2JNRRiA4WnAl8GwYr6BK94ute7Nk=
X-Received: by 2002:a05:701b:428b:10b0:141:52e3:85fb with SMTP id a92af1059eb24-144f90d9a4cmr1727836c88.5.1790136105360;
        Tue, 22 Sep 2026 21:01:45 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:64ea:2efb:709e:b783])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9390183sm2426374c88.0.2026.09.22.21.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:01:45 -0700 (PDT)
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
Date: Wed, 23 Sep 2026 09:31:36 +0530
Message-Id: <20260923040136.13432-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922180458.5c54ebb8@kernel.org>
References: <20260922180458.5c54ebb8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jakub,

We have vendored the temporary UAPI header changes into the GitHub 
development branch (https://github.com/H-N41K/iproute2-next/tree/fq_pie_class_stats/)
as requested, so it should now build standalone in your CI pipeline. 

Please note that this header sync commit is not present in the official 
iproute2 patch submitted to the mailing list 
(https://lore.kernel.org/netdev/20260922211139.38570-1-hemendranaik@gmail.com/). 
It was added to the GitHub branch strictly for validation and testing purposes.

Regards,
Hemendra

