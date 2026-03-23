Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102243B27CE;
	Mon, 23 Mar 2026 14:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276786; cv=none; b=IVZpkytzf1bH/WxDL+Ua4UqllDMxEYPWQKo9ewSCaBOrOcUrp6ndSRqy5Hi6kIuVbAcovsRTJB0ar8DPP9+Fc78xDecIElt0QshOXeMxmAC+KCbfxmHzOOD2uKgU8A41qBqISAjdpsQEHKf8OmEHBvELUCvD6GLufIVCmwNCBqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276786; c=relaxed/simple;
	bh=WjpyIImVOdHQP0Dp+E2Ymz04BmYIyHTzmlYl/9ZX7Eo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N7YXrxF2FWgXRfyiY7hrckJZApe0XMBWaTxqHbM1ILM0jC7KuqFBs4NmflNylnvyGJuomAFA17ljjxIgUGA1ytGbQam6YlkAG722XK/5roF8r3KYfrCVUK9bD3AhczVLPKZIMhRZJ3f+nJKUB9xzDSo/VeZ5dFOcHlYB8YAS8po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0XbqDc7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0XbqDc7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A12CC4CEF7;
	Mon, 23 Mar 2026 14:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276785;
	bh=WjpyIImVOdHQP0Dp+E2Ymz04BmYIyHTzmlYl/9ZX7Eo=;
	h=From:Subject:Date:To:Cc:From;
	b=s0XbqDc7XviCD2Md3dJZojCWQjlGtXGNO8iRWeA0PRbezrzQyIcWSXQMDiq3VQAPL
	 2o6XnIOrR5rmdPybttqC1+InHnKg+KrUuNO1uhcMWezz+8QnRavKMk0RKuV5OWpC8c
	 jh9mae0JbTR9awm8NO7giSG0GSF/7oOcuUpAQhMmR2EC5nrox9DIHPilbRi1e06o06
	 WsLlv+GfTURlvJapfdo0FO3tNvpjyK0vg/y52vegjU9oavvma4sOrlSpmBLUUAmowe
	 XiNBtEJtH+QKnxalT/J+EHfngX4lEUE1q8HxG4ZX56Gb8Kw45vOXS+xowSE72T0A4y
	 JnWSPo8NpdSnQ==
From: Jeff Layton <jlayton@kernel.org>
Subject: [PATCH v5 0/2] firmware_loader: allow firmware_class.path to take
 multiple paths
Date: Mon, 23 Mar 2026 10:39:29 -0400
Message-Id: <20260323-fw-path-v5-0-e88b2fe145f3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOywqDMBBFf6Vk3ZRJTDR21f8oXSQ60dCikohtE
 f+9UegLcXkvc87ckQT0DgM57kbicXDBtU0Mcr8jRa2bCqkrYyYceAoJy6i90073NdWQiyIBLnM
 tSbzuPFr3WEznS8y1C33rn4t4YHP7dqiPY2CU0UwpUebGpkzZ0xV9g7dD6ysySwa+AfIIKs0gR
 ZMzNGIFJhtgEkGdAdOgTBHXr0DxA3L4gmKeKkWG3EJZpP8fp2l6AeHjrLNKAQAA
X-Change-ID: 20260317-fw-path-a094c30259a5
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Michal Grzedzicki <mge@meta.com>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=WjpyIImVOdHQP0Dp+E2Ymz04BmYIyHTzmlYl/9ZX7Eo=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpwVCrXGiCF8c0nqBwd+MereNgitCudLrRl08KZ
 ZuplYBccQmJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCacFQqwAKCRAADmhBGVaC
 Fc2uEACNQlOzy3kFGAyK0MaKH/dB9hjxotc1ZjC3sxCM0smJbr0NQV0lla4yfege4UJfYPHGBQY
 ht2lYo11BrvYTSZ0IuG2U7heOPGo0hgabfJz9P64dlHY8QmFjohFs65zf9cYmFnyivtPCERNxcd
 nv1U6DO5FZZJBmLMpGO0mD3jvIljZYYNQC3ZqftUOx02h51CLv0aLLREWhI8MKaRr6mOHUKpt0Q
 4XHFbbaqO5WtfcH7/jkHD4rfK45LFXJiIGWvsrq0nZPcCgb+lZByaHWci+vMBX1lFY4OxcWnCx6
 MecqeJHHDDRgNlKGK21ZtNptwZaob0rgwY0/yHliIX8WDG87fzjkKR0M8W+wd+CKbRZseCurJm/
 s9LtD4tdZyxRmr0lcIyP6AOm/WKMx6CaxVLsTH+dB/Y9BsqXy7lSNHyUE/LwQPdj54sJL5nvYYQ
 I0hBo3XmrOgK11gcx2vtpXUmkzXOle9OC1QTsVUF82j5FRHcJ2L8fzJMDLsi/g0ZG53pd5rNwTc
 m0CF36L9VUu6Es5kAFmB6oMi3wGMWfpc8DiYwGDZlsccH2/diRfRNwwFEmlZoY2DyKVINYie3p6
 qwtgkpMZHfTQzMjYBiPVNcas1z8BjAKScJ8xw9OfCPtcJPAf3uomX+vTI0N3LWXPevJNryIeNTW
 g92XTue6R8DzWEQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215

This is something Michal had asked for last year, and I just got around
to implementing. This version also adds some selftests for this
functionality.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
Changes in v5:
- Increase search= string length from 256 to 4096
- Preprocess search= path when it's set rather than on every firmware load
- Add selftests for search= functionality
- Link to v4: https://lore.kernel.org/r/20260320-fw-path-v4-1-7547e2f0dc64@kernel.org

Changes in v4:
- Move search path to new search= option that is tried after path=
- Link to v3: https://lore.kernel.org/r/20260318-fw-path-v3-1-a701a08bc025@kernel.org

Changes in v3:
- Allow '\' to escape a literal ':' or '\' in the string
- Link to v2: https://lore.kernel.org/r/20260318-fw-path-v2-1-8a106eb91eb4@kernel.org

Changes in v2:
- switch to using ':' as path delimiter
- Link to v1: https://lore.kernel.org/r/20260318-fw-path-v1-1-7884d9bf618f@kernel.org

---
Jeff Layton (2):
      firmware_loader: add search= module option for multi-path firmware lookup
      selftests/firmware: add search path test for firmware_class.search=

 drivers/base/firmware_loader/main.c           | 273 +++++++++++++++++++-------
 tools/testing/selftests/firmware/Makefile     |   2 +-
 tools/testing/selftests/firmware/fw_search.sh | 222 +++++++++++++++++++++
 3 files changed, 420 insertions(+), 77 deletions(-)
---
base-commit: c369299895a591d96745d6492d4888259b004a9e
change-id: 20260317-fw-path-a094c30259a5

Best regards,
-- 
Jeff Layton <jlayton@kernel.org>

