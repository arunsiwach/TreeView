﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TreeView1.aspx.cs" Inherits="TreeView.TreeView1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style>
    .tree {
  --spacing: 1.5rem;
  --radius: 10px;
}

.tree li {
  display: block;
  position: relative;
  padding-left: calc(2 * var(--spacing) - var(--radius) - 2px);
}

.tree ul {
  margin-left: calc(var(--radius) - var(--spacing));
  padding-left: 0;
}

.tree ul li {
  border-left: 2px solid #ddd;
}

.tree ul li:last-child {
  border-color: transparent;
}

.tree ul li::before {
  content: '';
  display: block;
  position: absolute;
  top: calc(var(--spacing) / -2);
  left: -2px;
  width: calc(var(--spacing) + 2px);
  height: calc(var(--spacing) + 1px);
  border: solid #ddd;
  border-width: 0 0 2px 2px;
}

.tree summary {
  display: block;
  cursor: pointer;
}

.tree summary::marker,
.tree summary::-webkit-details-marker {
  display: none;
}

.tree summary:focus {
  outline: none;
}

.tree summary:focus-visible {
  outline: 1px dotted #000;
}

.tree li::after,
.tree summary::before {
  content: '';
  display: block;
  position: absolute;
  top: calc(var(--spacing) / 2 - var(--radius));
  left: calc(var(--spacing) - var(--radius) - 1px);
  width: calc(2 * var(--radius));
  height: calc(2 * var(--radius));
  border-radius: 50%;
  background: #ddd;
}

.tree summary::before {
  z-index: 1;
  background: #696 url('expand-collapse.svg') 0 0;
}

.tree details[open] > summary::before {
  background-position: calc(-2 * var(--radius)) 0;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <ul class="tree">
  <li>
    <details open >
      <summary>Giant planets</summary>
      <ul>
        <li>
          <details>
            <summary>Gas giants</summary>
            <ul>
              <li>Jupiter</li>
              <li>Saturn</li>
            </ul>
          </details>
        </li>
        <li>
          <details>
            <summary>Ice giants</summary>
            <ul>
              <li>Uranus</li>
              <li>Neptune</li>
            </ul>
          </details>
        </li>
      </ul>
    </details>
  </li>
</ul>
        </div>
    </form>
</body>
</html>
