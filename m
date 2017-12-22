From: shuahkh at osg.samsung.com (Shuah Khan)
Date: Fri, 22 Dec 2017 15:40:57 -0700
Subject: [Linux-kselftest-mirror] procfs/sysfs test plan
In-Reply-To: <CAFk4oe1+GcU-q3F_-QndsD6W+QhLGvT+f_x0WyEnUpVOhk65Mw@mail.gmail.com>
References: <CAFk4oe1+GcU-q3F_-QndsD6W+QhLGvT+f_x0WyEnUpVOhk65Mw@mail.gmail.com>
Message-ID: <36b5bb4e-2133-1eeb-944c-2a9da61563ea@osg.samsung.com>

On 12/22/2017 03:28 PM, Tri Vo wrote:
> Hello,
> 
> Android kernel team is planning to develop procfs and sysfs tests and
> contribute them to linux-kselftest project. The plan for sysfs tests right now,
> as suggested by Greg KH, is to write a minimal "generic" test framework
> that allows you to easily specify:
>         - file location
>         - expected value type (integer, string, range of values, etc.)
>         - expected permissions
> 
> Could/should this approach be extended to test procfs and other virtual
> filesystems? We would really appreciate some input on the test plan. :)
> 

This proposal sounds similar to the work I have done in the past. I have
been thinking about proposing to use this framework for sysfs and procfs
files and add it to Kselftest. Kind of stayed on my back-burner for a bit.

Can you please take a look at

https://github.com/shuahkh/linalyse

and see if that would work as base for the work you are proposing.

For example:

One of the options takes an input file with list of required files. Each line
specifies a file and data range. It checks if files exist.

If file is a regular files, it will check the contents.

	Each line in the input file has comma separated fields. e.g:

	/sys/class/backlight/*/max_brightness,4000,5000

	The above will expand to find all max_brightness file.
	Data is compared to be within the range: 4000 < data < 5000

	/sys/class/backlight/*/max_brightness,4000,

The above will expand to find all max_brightness file.
	Data in the file is matched to 4000.

I was using this to regression test my test systems for a while back.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
