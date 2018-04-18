From: mcgrof@kernel.org (Luis R. Rodriguez)
Date: Wed, 18 Apr 2018 22:35:09 +0200
Subject: [PATCH driver-core 1/2] test_firmware: Install all scripts
In-Reply-To: <20180404203712.zecit6po44qsde4c@xylophone.i.decadent.org.uk>
References: <20180404203712.zecit6po44qsde4c@xylophone.i.decadent.org.uk>
Message-ID: <20180418203509.GP30543@wotan.suse.de>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180418203509.vGDM-m_agVGiU1IyKMJN2E612ojN4bq18yMMx3AhfIg@z>

On Wed, Apr 04, 2018@10:37:13PM +0200, Ben Hutchings wrote:
> List all the scripts invoked by fw_run_tests.sh, so that
> "make TARGETS=firmware install" keeps working.
> 
> Fixes: 29a1c00ce1df8 ("test_firmware: add simple firmware firmware test ...")
> Fixes: b3cf21fae1fe0 ("test_firmware: test three firmware kernel configs ...")
> Signed-off-by: Ben Hutchings <ben.hutchings at codethink.co.uk>

Acked-by: Luis R. Rodriguez <mcgrof at kernel.org>

  Luis
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
