Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24E438E8BA
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 11:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587196; cv=none; b=uN3E1P4+dtxMvo3Nc1aFe5bQcmrkgTYYzADmudPsq6cmW8pkKK/xHYjtp51JzMCtiZ8FPtD8ixQsbuJPrB+mxtVNqLS3s2iNEChtHNe92SclHODuXbg2yy6j+I85ZggHY4v5Qn+PFMnjKZ1kElrHMwS399lc7Wpsrir8AXbO9r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587196; c=relaxed/simple;
	bh=RgA2s/ETiOsSC/3tONU50v90I3+p2ImRh+ak2kO9UFU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S2ePeUZDjH2Ow53IatLSBHjfP82geK5L9Mo+Fritq5ClJridQ3kTSG7HiJ65HzqJO4CDrx3YY3EGp/5IIAI93HB96uZpYC710zF12u39NgZyzECgXPVTDiU6feBYTuB4lyancT8aQAPMxGWFJAVFS2zgLfrBb8USEpurcRVKJYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MeprPw79; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4jQ40jX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MeprPw79";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4jQ40jX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAkd24740351
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 11:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3neawzxRuWoJiguAZtl2rO
	1U5dIQZaPDLZpbfcRIhj8=; b=MeprPw791zFDSZDkXkrnYgN8hAi+1yvykZs6yg
	p3ah7WWeZSs0NpgxcL5qjOoU4t5ZPnlmLuBjjhPUkuhIxpuzPfnJOp1niXGVUYgB
	0Vs0ZjnvytQrgBD4UhvRq+ixovFmXFGDqckcK623t2QpSKizfzzCNJeaF8UYuGtb
	uw+udkDsxrAJjQMb6Pol6zZXBHR2DXD8qeiC4zE4ZQXLcn/vHrjP+cCwjTD4tASY
	ChBu5iv1ftBhk6FwPrKzqheJtq/KImKlg3/WsFDAEBxtoFBn6wLwp+PxRpXmWywg
	FxM0eykpG0iQLOjXzjT545l+sLBM/PrpGVdCq2wJ2Lzvd2Gg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhrcbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 11:59:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50edf01172bso135379001cf.2
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 04:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778587192; x=1779191992; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3neawzxRuWoJiguAZtl2rO1U5dIQZaPDLZpbfcRIhj8=;
        b=a4jQ40jXU4CMMtrIJX851FTaI5pnxnZa7uX0nB48Q5SU/c6yA8VGO7aL1MG0pk6a6s
         V/9sqU9DSXsiYq3t06if+c0GTusL3ZJHVlGRx9FQzOBaFekLTwwfDyWoPIDDL/0XF+hl
         ANtfJ+n4troCW+0/s8f/fKL5G6Gigj3d14CyskOBIMv9/fNfq9uteHJygC8chyaY0po3
         n4dRKDC2qfuFLIpZRaMaypD7EmN3KTcAA614FteWPCXwjuy25soXAq8qDDZcwybs40ad
         kihlsAf/0HT6kF5M7+EgSy8Mvc1bVKhHZPlO/gy6souup4TMN05QmyAEpjCJK54GGY0b
         TI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778587192; x=1779191992;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3neawzxRuWoJiguAZtl2rO1U5dIQZaPDLZpbfcRIhj8=;
        b=N21BDOzsC2NqtNKmJ+kgsl+nTEM16n0zctlu1Wd1RbXbEgwqvIPgHJttt0R4xkJfHD
         JuKL7PpP64Wlpf0mX1ftxfN4rJkqXzNXOzTz0/XuasOxMu3EW5x8QoYbyZ/ceVLqscqD
         5TDwUUSOgESe8/H8izY4ePJLqk0asxCYNCk9jLmyx1Nq6SJF3ZDN1RNOGfXjzU/TQe/y
         M7LE6H2uAv9nzG8mHp6PDT9zbkEEj1wfWGhe+OCOvCGl141nYZhwnX5etgeE992YMQXP
         gzI5J6YKGdwQIO5eG/DD52CgfcYHlepw0ucyS+UZiUdcOIKzYzznEwrOCzYCtEQtvR3W
         hLWg==
X-Forwarded-Encrypted: i=1; AFNElJ+H/6Kf3L9GJ3BJFHmgF2aCHTKSvGX84NwkJQ0S1Z5H885g2/PeocGfwl7wPBAWmubqXhPxEbdtTtzYeBes5hU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHy8nTF0gtCvhmONhCV6aeECl1hcB+iouXJZxFFXf6ZTA9B7by
	XOGnzOSNCKBeN3Ny4ryY6eWj8i3YTdQHPtajTZDiZzP9w25kUWUd3bIuEbS8zKSrtRyotLYU7XR
	HvcaskOsQ6X8+20h7Qf9B3ZmOwnfDRIYBF7CUX62acY3oRZDxeu/2MIatJgAg/VyffvJP71w=
X-Gm-Gg: Acq92OF+jLO7JSMHF8y6fsU9ovYbT2eBg4KDqlJ+5wVfJPR3MrCkmKChtanyqvp84sd
	ZoJC7bRdkhxRVXQ/xn9ALF8MRiZUj1enCrS44FXPcP7wbPyiLr3Hr/1NyYsIpklOq0VeTiJXOYI
	5Dw/gCAX6+c11OoriM7+7YO4ucK+Gvl2u4C/yA1rIAxibehLK99xXgWJEEaQW29Cib3/uzvR6tU
	7J0fg5V1/ZhnPfsiglS/yPkwTZaiPxUU8D4IiuC/KTU6X+3o6evQQztk3B7uPOtCNqsV1ZthUEE
	bfLyBep1JUL+/wDzrAwqlDoFv4IiHF6FSzxuD0IouaF7aEYSoOIvCl4E4FWMu067T6phmFaw3/m
	Wfm6CeK4VUifq44WejdZFkF2zFHAFq4DcOXl/2PJGPVnM+q8hV20=
X-Received: by 2002:a05:622a:199a:b0:50b:2eee:4b38 with SMTP id d75a77b69052e-514619de95emr397544901cf.8.1778587191932;
        Tue, 12 May 2026 04:59:51 -0700 (PDT)
X-Received: by 2002:a05:622a:199a:b0:50b:2eee:4b38 with SMTP id d75a77b69052e-514619de95emr397544511cf.8.1778587191457;
        Tue, 12 May 2026 04:59:51 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:74a7:1c82:3f14:b431])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e9067811dsm73933355e9.9.2026.05.12.04.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 04:59:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v5 0/7] driver core: remove software node from platform
 devices on device release
Date: Tue, 12 May 2026 13:59:22 +0200
Message-Id: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABoWA2oC/43PsW4DIQwG4FeJmEsENvSiTn2PqgNgX4LUgxYak
 iq6dy+X6Ybm1MXS7+H77ZuoXCJX8bK7icIt1phTD/ZpJ8LJpSPLSD0LUPCsjFayXlImloWn3Fj
 mJImbPKfCR2nAj8F4QO8OogOfhcd4veNv7z2fYv3O5efe1fSy/RfbtFQy0ECo7Ijk4TXXuv86u
 4+Qp2nfh1j0BisRcFOELiq2oDEQA9MDEdfiYVPELlpET2HQHoAfiGYl4vbXZrlR28GQU44J/xD
 nef4FFJbieMEBAAA=
X-Change-ID: 20260410-swnode-remove-on-dev-unreg-42bfc4b23ba8
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3503;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RgA2s/ETiOsSC/3tONU50v90I3+p2ImRh+ak2kO9UFU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqAxYnbnSB8uRw3SqZx+7HL9YftDRf2Hmavqm77
 0qwC5oVHaCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagMWJwAKCRAFnS7L/zaE
 wxghEACowF1Mkl+w1sNCuuqh+NdmCs1NUavW4nlxm3wgGBZAAFJ8ZgwcWUe2rPCdwhTljkV8G05
 cYP5RwR1c97BjKXb+aSKMTOBS+xCKCw0LZp4j1kP6GqehfgMcRgVeqlvuG8MsMluEQCrssOmxJt
 PV9sPTtRVjCWIZqeEatN9V/3xT8qSwWs2uK0jyitb1xSmgV7/cjnjrEAdQAe9PuZtgpoZc+03Td
 x2SVw6/ZVG3duDEte5pBHE0yHYy7nFwEdkXfmSh1hEGiAAVHPWmZiW/hD6OWWpImba6gl4V8SEO
 8VDUC3UoPQiJj2F1b8lMxVHN/Te/xczH/u9A/OtU4KZKLeYf4H2N6h4Wokd50hE+gEKUxBHQKZ0
 lBoCkfWsIIy215PHedxu4RZo4L3eA0aLE8u+v/HKAyEoT8YceSX2qsM3uLv4F51CbJaTnLSS9Eu
 x3HNVAfVPpdYiqa1NMlAa5z66FM5OKeVsQVoH6qYNqph44vJIl/D46zsEx3CIAjIwhCegTFk98R
 xnR5HwFwBiInYWcfkDdyMZBF5DCWM85bs65Sd8Q9lQzoVISrZfoUV22rpXAW3AtmF9HJEzt40Q7
 zYW7nc9b/vxJ04kKY+e868muDM3PKHe/MtL1dCcn6l2LDqGFzcJD+S1zwFZwEsU5k3O15kSLFcQ
 q8BoUymNuBisTfA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNCBTYWx0ZWRfXxQ0sB8yBbYCp
 cBS2Jg6C7c6pqQmdftv7F8BBYEMBIjEbubkx1JmY+Eti1/c85SQgHpD585m8H0o0Nd/UPgpQ3eB
 wZgKjNPXvHoyGDlTbb0NpG2bSnMJoVlXEC9YOSXrRdcYCJ4DufVAioiWZEZ+MvWDFbeB65Oznkz
 TpPqCt/UQXgpRo/maYKo3cpG/9kn0kkYqxOh0qgMMBWMIlKEz1bsxDhJOfqFRXKWJ98SFbD+4hK
 07VbNcy8cXxZI05bLk9zC1Wke441ilc2Uy+1/wKOQqMq0lzzLVBySiOtwSGs/o3aL/ga43EEfIB
 2fBzxJ3uqvlDf9ktazfwVm3QkJCbfFvNrVlKEENwUMbVw+voZurIt8tbIhM/sgo1tFajexWN+nY
 VVjP4ojDpye2SSOGeUNwPJc3BFfsYomx64kQKLNNXgY3K+dAGW4V84R/D/SpbNBGlMcONN+Yv37
 miaIxx0sYDNN+5Tg79Q==
X-Proofpoint-GUID: Hwze5TQW5TdULWTnGjC6kvaujQ8ngYTn
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a031638 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=pOVGAA1bDAHTFGk8ZFsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: Hwze5TQW5TdULWTnGjC6kvaujQ8ngYTn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120124

This fixes an issue in platform device code where, if we specify a
software node for a platform device using struct platform_device_info,
it will not be removed on device .release().

This is an extended approach from v4 where we also first introduce
necessary changes in drivers where the fix may cause a regression.

Merging strategy: Danilo suggested that the new interface we add in this
series as well as prerequisite driver changes can still land in v7.1 so I
think the entire series should go upstream through the driver core. The first
5 patches are part of the fix and the remaining two add tests which
can't really do harm.

DRM and platform maintainers: please Ack the two driver patches in this
series.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v5:
- Provide a helper for users of platform_device_alloc() that wish to
  assign a software node to a platform device
- Rework drivers that could regress after the swnode leak fix
- Split the series into several patches as necessary
- Link to v4: https://patch.msgid.link/20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com

Changes in v4:
- Drop redundant !pdevinfo->swnode check in
  platform_device_register_full()
- Handle all three combinations with which two software nodes can be
  assigned to a platform device
- Extend the new kunit test to verify all three combinations
- Link to v3: https://patch.msgid.link/20260428-swnode-remove-on-dev-unreg-v3-0-533bdc71b22e@oss.qualcomm.com

Changes in v3:
- Make sure the reference of the primary software node we possibly take,
  is always released by moving the get() before calls that may fail
- Don't allow passing two software nodes
- Add a test case for that situation
- Link to v2: https://patch.msgid.link/20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com

Changes in v2:
- Change the order between removing the software node and dropping the
  reference to the device's OF node
- Address a situation where a software node is used as the primary
  firmware node
- Add a patch adding a new kunit helper
- Add another test case
- Link to v1: https://patch.msgid.link/20260410-swnode-remove-on-dev-unreg-v1-0-cd7d305f3db2@oss.qualcomm.com

---
Bartosz Golaszewski (7):
      platform/surface: gpe: use platform_device_register_full()
      driver core: platform: make the swnode check stricter
      driver core: platform: provide platform_device_add_software_node()
      drm/xe/i2c: use platform_device_add_software_node()
      driver core: platform: remove software node on release()
      kunit: provide kunit_software_node_register()
      driver core: platform: tests: add test cases for correct swnode removal

 drivers/base/platform.c                  |  44 +++++++-
 drivers/base/test/platform-device-test.c | 168 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_i2c.c              |  21 ++--
 drivers/platform/surface/surface_gpe.c   |  36 ++-----
 include/kunit/fwnode.h                   |  19 ++++
 include/linux/platform_device.h          |   3 +
 lib/kunit/Makefile                       |   3 +-
 lib/kunit/fwnode.c                       |  52 ++++++++++
 8 files changed, 307 insertions(+), 39 deletions(-)
---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260410-swnode-remove-on-dev-unreg-42bfc4b23ba8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

