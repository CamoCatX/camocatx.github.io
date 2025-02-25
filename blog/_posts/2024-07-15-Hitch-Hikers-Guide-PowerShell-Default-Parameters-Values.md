---
title: "The Hitch-Hikers Guide to PowerShell Default Parameters and Values"
description: "PowerShell commands like Get-Host and Get-WinEvent can be leveraged for color customization and output segmentation. Learn tips to enhance script readability and performance"
published: true
tags: [powershell, powershell-performance, color-psychology, tips, windows, shell-scripting, console-customize ]
---
Perhaps you dream of the everything script. It handles every exception perfectly, it runs at optimal speed, and its code complexity is maintainable. Well, I might to be the first to tell you that it’s nearly impossible. Either you will sacrifice on unoptimized code that only a beginner can read or with code that uses that latest or different features. I personally would advise just learning the language better, this post is not for the faint of heart. We will start with colour. The psychological effects cannot be underestimated. They are the [mother tongue of the subconscious](https://rmit.pressbooks.pub/colourtheory1/chapter/colour-psychology-physiology/). They speak the language of gender, grades, and identity. What better way to enforce identity politics and division than to give your script style. Here’s a nice start:

```powershell
$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "Green"
```

A pretty, haxx.ps1 theme perhaps? But let me explain how this happens. PowerShell commands often contain output than is naturally divided into sections. For example;

```powershell
Get-WinEvent -ListLog *
```

Lists some, (but not all) of the informative logs that Micheal Scoff eats and throws up to the highest bidder.
> **You may want to run this with admin privileges, because some of my tests complained about that.**
If you look at the top of the output, you should see:
> LogMode   MaximumSizeInBytes RecordCount LogName
Each of these sections you can divide, or parse the output into, so if you only want to read the name of His Majesty’s royal records, you can instead type;

```powershell
(Get-WinEvent -ListLog *).logname
```

Since this is one of the sections that is listed on top of the original output, we can have it in smaller, more readable, and desirable ways. This trick is especially useful when getting output from a script, like so…

```powershell
(Get-Package -AllVersions -Force).Name | Select-String -SimpleMatch -Pattern ‘Git’
```

> **If you invoke something like this multiple times, it would be a good idea to optimize it with writing the first part to a variable or file, then matching it there.**
But how does this relate to the colours? Because to understand how the first two commands listed at the start of this post, one must understand the concept of segmentation. Understand the language, get out of tutorial hell. Now, let’s apply this concept with;

```powershell
Get-Host
```

[This command](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-host) returns variables and such that are helpful when changing the layout of a shell. When run, it does not help much in our quest, because it is a command that contains other directories or pieces of it. Get-Host is simply just an alias for…

```powershell
$Host
```

Which is the first part of our command. And I know you get where I’m going with this, but just keep reading like yet another spiderman movie, you really think Andrew Garfield is the best one? Following the tracks to evoke…

```powershell
(Get-Host).UI
```

Which points to Raw UI… Which shows us the variables for colours changing.
> **Don’t think this concept is a onetime deal, it’s all throughout the language and you can find some pretty interesting stuff with it.**

Now if you want to know all the emotions available on your palate, [this command](https://stackoverflow.com/questions/20541456/list-of-all-colors-available-for-powershell) will produce an over-engineered example:

```powershell
$colors = [enum]::GetValues([System.ConsoleColor])
Foreach ($bgcolor in $colors)
{
  Foreach ($fgcolor in $colors)
  {
    Write-Host "$fgcolor|"  -ForegroundColor $fgcolor -BackgroundColor $bgcolor -NoNewLine
  }
  Write-Host " on $bgcolor"
}
```

There’s more than what meets the eye, and some can change the speed of a program. For instance, on PowerShell 5.1 (you can find out with this command)

```powershell
(Get-Host).version
```

[There’s an issue that the Progress bar can significantly impact cmdlet performance](https://github.com/PowerShell/PowerShell/issues/2138) that Invoke-Webrequest and Expand-Archive will go many times fold over, just because it needs to write a light blue progress bar. Adding this to the code:

```powershell
$ProgressPreference = 'SilentlyContinue'
```

Will, by one report (same source) speed you download times by ~50X. Why this is still not fixed, well, they only did in the latest versions. A very helpful list exists here: <https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_preference_variables?view=powershell-7.4>
