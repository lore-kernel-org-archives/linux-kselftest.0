Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D75445AD0
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 18:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928090; cv=none; b=fsyLfeOSNII49/wz+tRC//nJ43AliCWZ4iVY2Ed+vxbXk7MhbC4cHhx5XLZsUppPSC3jusg0nvzEK/aug1P/rTZ+FmXn2mDnM/YREi/JjqoQdsnddCdJUrvM6BXxmak02GiSqTaaxFu9oT19duRulioc7ghd5t/RgX0eU6S/bBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928090; c=relaxed/simple;
	bh=WXF66WmtMtCT657v10dcTOpqc4WfEbuJJpMl3klh4YM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZrYbDfCI1eAv8MyAu61KuMxrlV+7zVKDRRPTVmISlKwPlcOrDBpw2ktBkTYLrL+rhBo6YBuQSZmHPJLHuUcNkAv4jBK6NIO5nc9X5T7iaeJWTKdUMQGbqs3ifeY0lC4apBiHSmWFAFFoC1eIzOBvDQkYyvTT73qhTfvQR60qCrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzyzQgNr; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzyzQgNr"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eefae4so6822885ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 11:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789928089; x=1790532889; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WXF66WmtMtCT657v10dcTOpqc4WfEbuJJpMl3klh4YM=;
        b=MzyzQgNrlzdBXuR15LDX/wzqNolpU1UwdkIVxi/HRm72W2hdgmjeU7kBu7paxZUhLH
         MU001Llk/9EjOHxIt+bYWriyKz2cIAcVQFuWnJAm20y/9YclW/xlhRKNGtLhRU9b0T7C
         erCzrzkA+kITuHhc3kwsUobmG1VufZ/UMlaxn2+wsb/nMI2EEz5qprM1NdpnInTssXJi
         hrZac22HhWLrOQG6ABtkoTzpca8JiNkW+4Ty7uMSphQlbLbhDdwxfq+Z5BBHIXF3t7ut
         ZDNHmvKMBZjZaivhdyOsHtduT7zxxnjiu6WBmcerExlcGNAYIgzYwpjwtdTwulQyto8M
         pmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789928089; x=1790532889;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WXF66WmtMtCT657v10dcTOpqc4WfEbuJJpMl3klh4YM=;
        b=PP4PsLYBfVqatJwXIa3jT/vG/ZkseZ7NGrHUa9q2MRJ6lGNI8//J70/E0DYoxyVSfR
         CIYk3a9vbqC7cfY3d6Yy2ouWJsOsv5PBW9BmRUOXblqgzChvd1U2sAPRv7jFA9LgbyW+
         IoGOx3riF7v19ECRGr25COi2uZ3LbvzwGIJTWzVWuToJiNDEjBBbB0iiX+cqdx98nEXK
         ph/g+eOgNUZZCUYqowdDqo71PnpImVF7beIIm4uK7d2nC+thn2JPOb8brvlHoxqac1PQ
         UPvAD53PBs7Rp6RodwLz02E9H/wHLKIsO7+e7KdfSl6p2Bc4ByH01dsFXZdfZSd8GU68
         FEQg==
X-Forwarded-Encrypted: i=1; AKwUvBxTJmt2fn8lA4WO6MIYr7PfMSaREPRO7SZerbPl4D8HBgT6tKZdOCIrBQzql4JK937+cM/CM5caNSxPIsWE1V0=@vger.kernel.org
X-Gm-Message-State: AFuF++ljLqDwHBzVolllqxEnp3T/ybVkPpivj0+gJo3/9tfjNOQpiGJ7
	p3mwI38/EJy0m6eBUN85RH+O37KVB2kBBL33MlzPqdHF8kCGGcgTR72P
X-Gm-Gg: AYBFou0v2XP2/W2VUdkQNhNTY6ONBPabFPWZbaxQTOuhsR8xQB+JzvsPMZDTVV8KUKw
	+4Kgwu0g63gJ0gKhtrWBPP5bRYl2n0sMbnoLkO+0oSGsYt4SmgZobLj6Emnke64rWLna94zNvLt
	MeZssqS2drQFp8CA0zG4nUHNStG3nt83btgcIhcxaQOsIeI/lcemnuDu6LI710hPm7LI0UIx0GS
	FrTf5Q6J12Vhjs8Fq7drljMradafOncdgeTiugPZeY/kLKwTiRhmI7ifnFTje6INsXIx9sfaIb/
	cIvJPshqMjBzl9VRCCbVSL+g5Wl1pzNeoAPfwq8k7BBJ5JYGSjRIMDHOTREC7WSwFKGuuDCUjgs
	HNsb9i9Xx+i3svi7weJpVIZRJd+Vg7JnQOv3dEXXbU1dA5DehHGdzriO1GhZm92rS1sapZ7A7Ja
	PT9onKOBzFoLcU4NVrKc62u0MbSox31sgn4va3P+L0dTNu+Dnd7KKKqfx/eY2BwjZciBb2nYWdl
	n3Z3Yw5WymahIyS5VEyCvgaLV/I5RO6G7Mh+QBx0v5aOIjuu1lr/V9UR2AxWcpKnHHMxTQYDakS
	e0H9
X-Received: by 2002:a17:90a:a82:b0:39e:6c66:cbdd with SMTP id 98e67ed59e1d1-39e6c66d00bmr3882116a91.21.1789928089015;
        Sun, 20 Sep 2026 11:14:49 -0700 (PDT)
Received: from phui-2.c.googlers.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e554e5529sm5863256a91.4.2026.09.20.11.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:14:48 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Guopeng Zhang <guopeng.zhang@linux.dev>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Waiman Long <longman@redhat.com>,
 Ridong Chen <ridong.chen@linux.dev>
Cc: Michal Koutny <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>,
 cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] cgroup/cpuset: prevent local partition activation
 over remote partition and sibling xcpus conflict
Date: Sun, 20 Sep 2026 18:14:47 +0000
Message-ID: <178992808796.3122215.5327280843811501376@gmail.com>
In-Reply-To: <aa90bb73-c2af-4d13-8f2a-0435aa528058@linux.dev>
References: <139d9231-4723-4365-9af7-8142e6581ede@linux.dev>
 <20260920082335.257680-1-benquike@gmail.com>
 <20260920082335.257680-2-benquike@gmail.com>
 <aa90bb73-c2af-4d13-8f2a-0435aa528058@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, Sep 20, 2026 at 04:57:39PM +0800, Guopeng Zhang wrote:
> I think this patch is still missing a Fixes: tag for the
> cpus_excl_conflict() change.
>
> The validate_partition() change can be covered by 6da580ec656a.
>
> However, the sibling CPU ownership issue fixed in cpus_excl_conflict()
> was introduced by the following commit:
> Fixes: 2a3602030d80 ("cgroup/cpuset: Don't invalidate sibling partitions on=
 cpuset.cpus conflict")

Thanks for pointing this out, Guopeng!

In v3, I have split the validate_partition() change (with
Fixes: 6da580ec656a) and the cpus_excl_conflict() change (with
Fixes: 2a3602030d80) into separate patches ([PATCH v3 2/3] and
[PATCH v3 3/3]) so that each patch fixes a single logical issue with its
corresponding Fixes: tag.

Best regards,
Hui
